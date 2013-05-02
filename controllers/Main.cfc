<cfcomponent extends="Controller" output="false">

	<cffunction name="init"></cffunction>
	
	<cffunction name="send">
	
		<cfset sendEmail(template="preRegister", from="support@weekendboxclub.com",
			 to="hello@weekendboxclub.com", subject="Pre-Register", data=params)>
		
		<cfset flashInsert(success="Thanks for registering for updates - we'll keep you posted with updates")>
		<cfset redirectTo(back=true)>
		
	</cffunction>

</cfcomponent>