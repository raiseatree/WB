<cfcomponent extends="Controller" output="false">

	<cffunction name="calcStartDate" access="private">
		
		<!--- Work out the start date so we have a buffer for ordering box contents --->
		<cfset dow = DayOfWeek(now())>
		
		<cfif dow LT 2>
			<!--- If Sunday, push order to a week Monday --->
			<cfset startInc = 8>
		<cfelseif dow LTE 4>
			<!--- Monday - Wednesday (inc) we can accept for first box following week --->
			<cfset startInc = (7 - dow) + 2>
		<cfelse>
			<!--- Thursday - Saturday (inc) push order to a week Monday --->
			<cfset startInc = (7 - dow) + 9>						
		</cfif>
		
		<cfreturn DateFormat(DateAdd("d", startInc, now()), 'yyyy-mm-dd')>
		
	</cffunction>

	<cffunction name="checkPromoCode" access="private">
	
		<cfif IsDefined("params.promoCode")>
		
			<!--- Loopup this promo code in the DB --->
			<cfset loc.promo = model("promocode").findAll(where="code='#params.promoCode#'")>
			
			<cfif loc.promo.RecordCount EQ 1>
				<cfset flashInsert(success="Your promo code was found and applied successfully!")>
				
				<!--- Check if the promo code is active and update the customer --->
				<cfset data.promoCodeID = loc.promo.ID>
				
			<cfelse>
				<cfset flashInsert(error="Sorry - your promo code #UCase(params.promoCode)# was not found, please check for typos and try again")>
				<cfset redirectTo(route="home")>
			</cfif>
		
		</cfif>
	
	</cffunction>

	<cffunction name="sha256" access="private">
		<cfargument name="Data" type="string" required="true" />
		<cfargument name="Key" type="string" required="true" />
		<cfargument name="Bits" type="numeric" required="false" default="256" />
		
		<cfset var i = 0 />
		<cfset var HexData = "" />
		<cfset var HexKey = "" />
		<cfset var KeyLen = 0 />
		<cfset var KeyI = "" />
		<cfset var KeyO = "" />
		
		<cfset HexData = BinaryEncode(CharsetDecode(Arguments.data, "iso-8859-1"), "hex") />
		<cfset HexKey = BinaryEncode(CharsetDecode(Arguments.key, "iso-8859-1"), "hex") />
		<cfset KeyLen = Len(HexKey)/2 />
		
		<cfif KeyLen gt 64>
		  <cfset HexKey = Hash(CharsetEncode(BinaryDecode(HexKey, "hex"), "iso-8859-1"), "SHA-256", "iso-8859-1") />
		  <cfset KeyLen = Len(HexKey)/2 />
		</cfif>
		
		<cfloop index="i" from="1" to="#KeyLen#">
		  <cfset KeyI = KeyI & Right("0"&FormatBaseN(BitXor(InputBaseN(Mid(HexKey,2*i-1,2),16),InputBaseN("36",16)),16),2) />
		  <cfset KeyO = KeyO & Right("0"&FormatBaseN(BitXor(InputBaseN(Mid(HexKey,2*i-1,2),16),InputBaseN("5c",16)),16),2) />
		</cfloop>
		
		<cfset KeyI = KeyI & RepeatString("36",64-KeyLen) />
		<cfset KeyO = KeyO & RepeatString("5c",64-KeyLen) />
		
		<cfset HexKey = Hash(CharsetEncode(BinaryDecode(KeyI&HexData, "hex"), "iso-8859-1"), "SHA-256", "iso-8859-1") />
		<cfset HexKey = Hash(CharsetEncode(BinaryDecode(KeyO&HexKey, "hex"), "iso-8859-1"), "SHA-256", "iso-8859-1") />
		
		<cfreturn Left(HexKey,arguments.Bits/4) />
     
    </cffunction>

	<cffunction name="init">
	
		<cfset filters(through="checkPromoCode", only="order")>
	
	</cffunction>
	
	<cffunction name="cancel">
	
		<!--- TODO Mail to mothership that this user has failed to complete PayPal --->
	
	</cffunction>
	
	<cffunction name="checkout">
		
		<cfif IsDefined("SESSION.customerID")>
		
			<!--- Decrypt the customer ID --->
			<cfset loc.customerID = decrypt(SESSION.customerID,GetEncryptKey(),'CFMX_COMPAT','Base64')>

			<!--- Load the customer's details (and main child) --->
			<cfset data.customer = model("customer").findOne(where="ID=#loc.customerID#", include="customerchildren", returnAs="query")>
		
			<cfif data.customer.RecordCount GT 0>

				<!--- Define vars here --->
				<cfset loc.client_id = GetGoCardless('app_identifier')>
				<cfset loc.merchant_id = GetGoCardless('merchant_id')>
				<cfset loc.nonce = CreateUUID()>
				<cfset loc.timestamp = '#DateFormat(now(),"yyyy-mm-dd")# #TimeFormat(now(),"HH:MM:SS")#'>
				
				<!--- Subscription vars --->
				<cfset data.payment.start_at = calcStartDate()>
				
				<!--- Bodge together our variables (Inc USER DATA) --->
				<cfset sigTemp = 'client_id=#loc.client_id#&nonce=#loc.nonce#&subscription%5Bamount%5D=8&subscription%5Bdescription%5D=A%20fortnightly%20box%20of%20healthy%2C%20creative%20and%20green%20activities%20delivered%20to%20your%20door&subscription%5Binterval_length%5D=2&subscription%5Binterval_unit%5D=week&subscription%5Bmerchant_id%5D=#loc.merchant_id#&subscription%5Bname%5D=Weekend%20Box%20Subscription&subscription%5Bstart_at%5D=#data.payment.start_at#&subscription%5Buser%5D%5Bbilling_address1%5D=#URLEncodedFormat(data.customer.address)#&subscription%5Buser%5D%5Bbilling_address2%5D=#URLEncodedFormat(data.customer.address2)#&subscription%5Buser%5D%5Bbilling_postcode%5D=#URLEncodedFormat(data.customer.postcode)#&subscription%5Buser%5D%5Bbilling_town%5D=#URLEncodedFormat(data.customer.city)#&subscription%5Buser%5D%5Bfirst_name%5D=#URLEncodedFormat(data.customer.firstname)#&subscription%5Buser%5D%5Blast_name%5D=#URLEncodedFormat(data.customer.surname)#&timestamp=#replaceList(loc.timestamp, " ,:", "%20,%3A")#'>
					
				<!--- Encrypt the signature --->
				<cfset signature = sha256( sigTemp, GetGoCardless('app_secret') )>
				
				<cfsavecontent variable="httpURL">
					<cfoutput>#Trim(GetGoCardless('gc_url'))#/connect/subscriptions/new?#sigTemp#&signature=#signature#</cfoutput>
				</cfsavecontent>
				
				<cfset data.payment.url = httpURL>

			<cfelse>
				<cfset redirectTo(route="home")>
			</cfif>
			
		<cfelse>
			<cfset redirectTo(route="home")>
		</cfif>
	
	</cffunction>
	
	<cffunction name="complete">
	
	
		<!--- TODO Mail to mothership that this user has signed up --->
	
	</cffunction>
	
	<cffunction name="confirm" hint="Receives the GET response back from GoCardless and then confirms the Direct Debit setup">
	
		<cfif IsDefined("params.resource_id") AND IsDefined("params.resource_type")>

			<!--- Make an API Call to confirm the subscription --->
			<cfhttp url="#GetGoCardless('gc_url')#/api/v1/confirm.json"
					 result="confirm_result" method="POST" 
					 username="#GetGoCardless('app_identifier')#" 
					 password="#GetGoCardless('app_secret')#">

				<cfhttpparam type="Header" name="bearer" value="#GetGoCardless('merchant_access_token')#">
				<cfhttpparam type="url" name="resource_id" value="#params.resource_id#" />
				<cfhttpparam type="url" name="resource_type" value="#params.resource_type#" />
				<cfhttpparam type="url" name="resource_uri" value="#params.resource_uri#" />
				<cfhttpparam type="url" name="signature" value="#params.signature#" />

			</cfhttp>
		
			<cfif IsDefined("confirm_result.status_code") AND confirm_result.status_code EQ 200>
				
				<!--- All worked out ok! --->
				<cfset redirectTo(controller="main", action="complete")>
				
			<cfelse>
				<!--- TODO Mail this error through --->
				<cfset msg = DeserializeJSON(confirm_result.filecontent)>
				
				<cfdump var="#msg#">
				<cfset flashInsert(error="Oops - Something bad happened. The error message was: '#msg.error[1]#'")>
				<cfset redirectTo(route="home")>
			</cfif>
		
		</cfif>
	
	
	</cffunction>
	
	<cffunction name="order">
	
		<!--- Create new customer and child instance --->
		<cfif IsDefined("data.promoCodeID")>
			<cfset data.customer = model("customer").new(promoCodeID=data.promoCodeID)>
		<cfelse>
			<cfset data.customer = model("customer").new()>
		</cfif>
		
		<!--- now create the child --->
		<cfset data.child = model("customerchildren").new()>
		
	</cffunction>
	
	<!---<cffunction name="process">
		
		<cfif IsPost()>
		
			<!--- Load the customer from the session --->
			<cfif IsDefined("SESSION.customerID")>
			
				<!--- Load the customer's details --->
				<cfset loc.customer = model("customer").findOne(where="ID=#decrypt(SESSION.customerID,GetEncryptKey(),"CFMX_COMPAT","Base64")#", include="promocode", returnAs="query")>
				
				<cfif loc.customer.RecordCount EQ 1>
				
					<!--- Define vars here --->
					<cfset loc.client_id = GetGoCardless('app_identifier')>
					<cfset loc.merchant_id = GetGoCardless('merchant_id')>
					<cfset loc.nonce = CreateUUID()>
					<cfset loc.timestamp = '#DateFormat(now(),"yyyy-mm-dd")# #TimeFormat(now(),"HH:MM:SS")#'>
					
					<!--- Subscription vars --->
					<cfset loc.start_at = calcStartDate()>
					
					<!--- Bodge together our variables (Inc USER DATA) --->
					<cfset sigTemp = 'client_id=#loc.client_id#&nonce=#loc.nonce#&subscription%5Bamount%5D=8&subscription%5Bdescription%5D=A%20fortnightly%20box%20of%20healthy%2C%20creative%20and%20green%20activities%20delivered%20to%20your%20door&subscription%5Binterval_length%5D=2&subscription%5Binterval_unit%5D=week&subscription%5Bmerchant_id%5D=#loc.merchant_id#&subscription%5Bname%5D=Weekend%20Box%20Subscription&subscription%5Bstart_at%5D=#loc.start_at#&subscription%5Buser%5D%5Bbilling_address1%5D=#URLEncodedFormat(loc.customer.address)#&subscription%5Buser%5D%5Bbilling_address2%5D=#URLEncodedFormat(loc.customer.address2)#&subscription%5Buser%5D%5Bbilling_postcode%5D=#URLEncodedFormat(loc.customer.postcode)#&subscription%5Buser%5D%5Bbilling_town%5D=#URLEncodedFormat(loc.customer.city)#&subscription%5Buser%5D%5Bfirst_name%5D=#URLEncodedFormat(loc.customer.firstname)#&subscription%5Buser%5D%5Blast_name%5D=#URLEncodedFormat(loc.customer.surname)#&timestamp=#replaceList(loc.timestamp, " ,:", "%20,%3A")#'>
						
					<!--- Encrypt the signature --->
					<cfset signature = sha256( sigTemp, GetGoCardless('app_secret') )>
					
					<cfsavecontent variable="httpURL">
						<cfoutput>#Trim(GetGoCardless('gc_url'))#/connect/subscriptions/new?#sigTemp#&signature=#signature#</cfoutput>
					</cfsavecontent>
					
					<cfset data.url = httpURL>
						
					<!--- Check if the customer is on a promo plan 
					<cfif loc.customer.setupfee GT ''>
						<cfset loc.paydata.setupfee = loc.customer.setupfee>
					<cfelse>
						<cfset loc.paydata.setupfee = 0>
					</cfif>--->
				
					<!--- Set the params for the payment --->
					
				<cfelse>
					<!--- TODO --->
					<cfabort>
				</cfif>
			
			<cfelse>
				<!--- Flast and forward home --->
				<cfset flashInsert(error="Sorry - your details weren't found, please re-register below:")>
				<cfset redirectTo(route="home")>
			</cfif>
		
		<cfelse>
			<!--- TODO --->
			<cfabort>
		</cfif>
		
	</cffunction>--->
	
	<cffunction name="register">
		
		<cfif IsPost()>
		
			<!--- Check the referrer --->
			<cfif IsDefined("params.customer.referral") AND params.customer.referral GT ''>
				<cfset params.customer.referral = 'Friend - ' & params.customer.referral>
			<cfelse>
				<cfset params.customer.referral = params.customer.referralLocation>
			</cfif>
			
			<cfset data.customer = model("customer").create(params.customer)>
			
			<cfif data.customer.hasErrors()>
				<cfdump var="#data.customer.allErrors()#"><cfabort>
			<cfelse>
				<!--- Add the customer id to the child --->
				<cfset params.child.customerID = data.customer.ID>
				
				<!--- Also put the customer id in the session --->
				<cfset SESSION.customerID = encrypt(data.customer.ID,GetEncryptKey(),'CFMX_COMPAT','Base64')>
				
				<!--- And add the child --->
				<cfset addChild = model("customerchildren").create(params.child)>
				
				<!--- Check the result --->
				<cfif addChild.hasErrors()>
					<!--- TODO --->
					<cfdump var="#addChild.allErrors()#"><cfabort>
				<cfelse>
					<cfset redirectTo(controller="main", action="checkout")>
				</cfif>
			</cfif>
		
		</cfif>
		
	</cffunction>
	
	<cffunction name="send">
	
		<!--- Check the captcha --->
		<cfif IsDefined("params.captcha") AND params.captcha EQ 8>
			<!--- Add in to the db --->
			<cfset addUser = model("preregister").create(params)>
			
			<cfif addUser.hasErrors()>
				<cfdump var="#addUser.allErrors()#"><cfabort>
			<cfelse>
				<cfset flashInsert(success="Thanks for registering your interest - we'll keep you posted and email you a coupon for your first box when we're ready to launch!")>
			</cfif>
		<cfelse>
			<cfset flashInsert(error="Sorry - you entered the Anti-Robot question incorrectly, please try registering again.")>
		</cfif>

		<cfset redirectTo(back=true)>
		
	</cffunction>

</cfcomponent>