<cfcomponent extends="Controller" output="false">

	<cffunction name="init"></cffunction>
	
	<cffunction name="toandy">
	
		<cfset customers = model("customer").findAll(where="blnPaid=1 AND ID >= 67 AND ID <> 109 AND ID <= 192")>
		
		<cfdump var="#customers#"><cfabort>
	
		<cfset sendEmail(to="andy@raiseatree.co.uk", 
				subject="Your Weekend Box Is On Its Way!", 
				template="/emails/customerWelcome",
				from="Weekend Box Club <hello@weekendboxclub.com>", 
				first_name=customers.firstName)>
		
		<cfabort>
	
	</cffunction>

</cfcomponent>