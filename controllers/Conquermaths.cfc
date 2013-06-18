<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
	
		<cfset filters(through="loadSubscriberInstance")>
	
	</cffunction>
	
	<cffunction name="complete">
	
		<cfif Not(IsDefined("params.ID"))>
			<cfset flashInsert(error="Sorry - the link you clicked on didn't seem to work, please go back and try again")>
			<cfset redirectTo(route="home")>
		</cfif>
	
	</cffunction>
	
	<cffunction name="confirm">
	
		<cfif IsDefined("params.code")>
		
			<!--- Decrypt the ID --->
			<cfset loc.ID = decrypt(params.code, GetEncryptKey(),"CFMX_COMPAT","HEX")>
			
			<!--- Check if that matches a user in the db --->
			<cfset loc.user = model("entrant").findOneByID(loc.ID)>
			
			<cfif IsObject(loc.user)>
				
				<!--- Update the user --->
				<cfset loc.user.update(emailConfirmed=1)>
				
				<!--- Now send the user a free activity --->
				<cfset sendEmail(to=loc.user.email, 
					template="/emails/competitionActivity",
					from="Weekend Box Club <hello@weekendboxclub.com>", 
					subject="Weekend Box FREE Activity",
					user=loc.user, file="Weekend-Box-Patchwork-Letters.pdf")>
				
			<cfelse>
				<cfset flashInsert(error="Sorry - your code was not found, please click on the link in your email again")>
				<cfset redirectTo(route="home")>
			</cfif>
		
		
		<cfelse>
			<cfset flashInsert(error="Sorry - your code was not found, please click on the link in your email again")>
			<cfset redirectTo(route="home")>
		</cfif>
	
	</cffunction>
	
	<cffunction name="enter">
	
		<!--- Create a new competition entrant instance --->
		<cfset data.entrant = model("entrant").new(source="conquerMaths")>
	
	</cffunction>
	
	<cffunction name="purchase">
	
		<cfif IsDefined("params.code")>
		
			<!--- Decrypt the ID --->
			<cfset loc.ID = decrypt(params.code, GetEncryptKey(),"CFMX_COMPAT","HEX")>
			
			<!--- Check if that matches a user in the db --->
			<cfset loc.user = model("entrant").findOneByID(loc.ID)>
			
			<cfif IsObject(loc.user)>
			
				<!--- Put the user's details in the session so we can prefill the form when they purchase --->
				<cfset SESSION.entrant = loc.user>
				
				<!--- Now render the Main>Plans page --->
				<cfset redirectTo(controller="main", action="plans", params="promoCode=CONQUERMATHS")>
			
			<cfelse>
				<cfset flashInsert(error="Sorry - your code was not found, please click back and try clicking the button again")>
				<cfset redirectTo(route="home")>
			</cfif>
			
		<cfelse>
			<cfset flashInsert(error="Sorry - your code was not found, please click back and try clicking the button again")>
			<cfset redirectTo(route="home")>
		</cfif>
	
	</cffunction>
	
	<cffunction name="save">
	
		<cfif IsPost()>
		
			<!--- Save the entry --->
			<cfset addEntry = model("entrant").create(params.entrant)>
		
			<!--- Check the result --->
			<cfif addEntry.hasErrors()>
				<cfset flashInsert(error="Sorry - an error occurred: #addEntry.allErrors()[1].message#")>
				<cfset redirectTo(back=true)>
			</cfif>
			
			<!--- Encrypt the userID for using as the confirmation code --->
			<cfset addEntry.ID = encrypt(addEntry.ID,GetEncryptKey(),"CFMX_COMPAT","HEX")>
			
			<!--- Mail through for confirmation of entry --->
			<cfset sendEmail(to=addEntry.email, 
					template="/emails/competitionCMConfirm",
					from="Weekend Box Club <hello@weekendboxclub.com>", 
					subject="Thanks for entering the competition - please click below to confirm your entry",
					userID=addEntry)>
			
			<!--- Flash and forward --->
			<cfset redirectTo(controller="conquermaths", action="complete", params="ID=#addEntry.ID#")>
		
		</cfif>
	
	
	</cffunction>

</cfcomponent>