<cfcomponent extends="Controller" output="false">

	<cffunction name="init"></cffunction>
	
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