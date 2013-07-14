<cfcomponent extends="Controller" output="false">

	<cffunction name="checkPromoCode">
	
		<cfif IsDefined("SESSION.promoCodeID")>
			
			<!--- Load the promo code --->
			<cfset promo = model("promocode").findOne(where="ID=#SESSION.promoCodeID#", returnAs="query")>

			<!--- Check if we found one and it's a summer holiday promo --->			
			<cfif promo.RecordCount EQ 1 AND IsDefined("promo.blnSummerHoliday") AND promo.blnSummerHoliday EQ 1>
				<!--- Set the flash message so the user doesn't get worried they're missing out --->
				<cfset flashInsert(success="<strong>Promo Code:</strong> Your promo code was found and applied successfully! <br />#promo.message#")>
				<cfset data.offer = true>
			</cfif>
		
		</cfif>
	
	</cffunction>

	<cffunction name="init">
	
		<cfset filters(through="loadSubscriberInstance")>
		<cfset filters(through="checkPromoCode", only="order,checkout")>
		
	</cffunction>
	
	<cffunction name="checkout">
		
		<cfparam name="publicKey" default="#GetStripe('publicKey')#">
		
		<cfif IsDefined("SESSION.customerID")>
		
			<!--- Decrypt the customer ID --->
			<cfset loc.customerID = decrypt(SESSION.customerID,GetEncryptKey(),'CFMX_COMPAT','Base64')>

			<!--- Load the customer's details (and main child) --->
			<cfset data.customer = model("customer").findOne(where="ID=#loc.customerID#", include="customerchildren,promocode", returnAs="query")>
		
		<cfelse>
			<cfset redirectTo(route="home")>
		</cfif>
	
	</cffunction>
	
	<cffunction name="order">
		
		<!--- Create new customer instance --->
		<cfif IsDefined("data.promoCodeID")>
			<cfset data.customer = model("customer").new(promoCodeID=data.promoCodeID)>
		<cfelse>
			<cfset data.customer = model("customer").new()>
		</cfif>
		
		<!--- now create the child --->
		<cfset data.child = model("customerchildren").new()>
	
	</cffunction>

	<cffunction name="process">
	
		<!--- Set up the order instance too --->
		<cfset order = model("order").create(
				customerID=decrypt(SESSION.customerID, GetEncryptKey(),'CFMX_COMPAT','Base64'), 
				orderStateID=1, orderPlaced=now())>
		
		<!--- Check we added that ok --->
		<cfif order.hasErrors()>
			<cfdump var="#order.allErrors()#"><cfabort>
		</cfif>
		
		<!--- Now add the main box as an order item --->
		<cfset addBox = model("orderitem").create(orderID=order.ID, item=params.planName, quantity=1, notes=params.notes)>
		
		<!--- Check if we need to add an apron order --->
		<cfif IsDefined("params.apron.item") AND params.apron.item EQ 'yes'>
			<cfset addApron = model("orderitem").create(orderID=order.ID, item='Apron', quantity=params.apron.quantity, notes="Size: #params.apron.size#; Customisation: #params.apron.instructions#")>
		</cfif>
		
		<!--- Check if we need to add a tshirt order --->
		<cfif IsDefined("params.tshirt.item") AND params.tshirt.item EQ 'yes'>
			<cfset addTShirt = model("orderitem").create(orderID=order.ID, item='T-Shirt', quantity=params.tshirt.quantity, notes="Size: #params.apron.size#")>
		</cfif>
		
		<!--- Load this customer from the database --->
		<cfset customer = model("customer").findOne(where="ID=#Decrypt(SESSION.customerID,GetEncryptKey(),'CFMX_COMPAT','Base64')#")>
		
		<cfif IsObject(customer)>
		
			<!--- Create a new Stripe customer (so we can then bill against this customer in the future) --->
			<cfhttp url="https://api.stripe.com/v1/customers" 
					result="customer_result" 
					method="POST" username="#GetStripe('secretKey')#:">
					
				<cfhttpparam type="url" name="card" value="#params.stripeToken#">
				<cfhttpparam type="url" name="email" value="#customer.email#">
				<cfhttpparam type="url" name="description" value="#customer.firstName# #customer.surname#">
	
			</cfhttp>
			
			<!--- TODO Wrap with a try/catch  Deserialize the response --->
			<cfset rtn = DeserializeJSON(customer_result.FileContent)>
			
			<!---  Check and make sure customer was set up correctly --->
			<cfif IsDefined("rtn.ID") AND rtn.ID GT ''>
				<!--- Update the customer record in our db --->
				<cfset customer.stripeCustomerID = rtn.ID>
				<cfset customer.save()>
			</cfif>
			
			<!--- Now charge that customer the balance on their account --->
			<cfhttp url="https://api.stripe.com/v1/charges" 
					result="bill_result" 
					method="POST" username="#GetStripe('secretKey')#:">
					
				<cfhttpparam type="url" name="customer" value="#customer.stripeCustomerID#">
				<cfhttpparam type="url" name="currency" value="gbp">
				<cfhttpparam type="url" name="amount" value="#replace(params.basketTotal,'.','')#">
	
			</cfhttp>
			
			<!--- TODO wrap this in a try/catch Deserialize the response from Stripe --->
			<cfset paymentResult = DeserializeJSON(bill_result.FileContent)>
			
			<!--- Check the result --->
			<cfif IsDefined("paymentResult.paid") AND paymentResult.paid EQ true>
				
				<!--- Update the customer to have been paid now (Note this method is now deprecated, use the orders table instead) --->
				<cfset customer.blnPaid = 1>
				<cfset customer.save()>
				
				<!--- Update the order status --->
				<cfset order.orderStatusID = 2>
				<cfset order.save()>
				
				<!--- Get the child's name --->
				<cfset child = model("customerchildren").findOne(where="customerID=#customer.ID#", returnAs="query")>
				
				<!--- Mail out an order confirmation email to Weekend Box --->
				<cfset sendEmail(to="hello@weekendboxclub.com", 
						from="Weekend Box Orders <orders@weekendboxclub.com>", 
						subject="Weekend Box order", 
						template="/emails/summerHolidayOrder",
						bcc="andystephenson88@gmail.com")>
				
				<!--- Finally mail out an order confirmation email to the customer --->
				<cfset sendEmail(to=customer.email, 
						subject="Thanks for your Weekend Box order", 
						template="/emails/summerHolidayWelcome",
						from="Weekend Box Club <hello@weekendboxclub.com>")>
				
			</cfif>
		
		<cfelse>
			<!--- Redirect back --->
			<cfset redirectTo(route="summer")>
		</cfif>
		
		<!--- Forward to the completed page --->
		<cfset redirectTo(controller="summerholiday", action="complete")>
	
	</cffunction>
	
	<cffunction name="register">
		
		<cfif IsPost()>
		
			<!--- Check the referrer --->
			<cfif IsDefined("params.customer.referral") AND params.customer.referral GT ''>
				<cfset params.customer.referral = 'Friend - ' & params.customer.referral>
			<cfelse>
				<cfset params.customer.referral = params.customer.referralLocation>
			</cfif>
			
			<!--- Check if we have a promo code in the session to use --->
			<cfif IsDefined("SESSION.promoCodeID") AND SESSION.promoCodeID GT ''>
				<cfset params.customer.promoCodeID = SESSION.promoCodeID>
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
					<cfset redirectTo(controller="summerholiday", action="checkout")>
				</cfif>
				
			</cfif>
		
		</cfif>
		
	</cffunction>

</cfcomponent>