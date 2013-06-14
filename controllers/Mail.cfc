<cfcomponent extends="Controller" output="false">

	<cffunction name="init"></cffunction>
	
	<cffunction name="toandy">
	
		<cfset customers = model("customer").findAll(where="blnPaid=1 AND ID >= 67 AND ID <> 109 AND ID <> 111 AND ID <> 102 AND ID <> 123 AND ID <> 137 AND ID <> 158 AND ID <= 192")>
		
		<cfloop query="customers">
		
			<!---<cfoutput>
				<p>Dear <span style="text-transform: capitalize;">#customers.firstName#</span>,</p>
				<p>I just thought I'd drop you a quick email to let you know your first Weekend Box is on its way now and should be with you shortly!</p>
				<p>Hope you have an excellent time with it and do let me know what you think of it as I'm always looking for feedback to help improve the boxes.</p>
				<p>Be sure to come and join Weekend Box on <a href="http://www.facebook.com/weekendboxclub">Facebook</a> and <a href="http://www.twitter.com/WeekendBoxClub">Twitter</a> for exclusive content, competitions and much more!</p>
				<p>All the best,</p>
				<p>Andy<br />Founder, Weekend Box Club</p>
				<p>t: 0191 328 0640 / 07545 998856 <br /><a href="http://www.weekendboxclub.com">http://www.weekendboxclub.com</a></p>
				<p>---<br />Come and join Weekend Box on Twitter (@WeekendBoxClub) or Facebook (/WeekendBoxClub) for exclusive content, competitions and much more!</p>
				<p><img src="http://weekendboxclub.com/images/weekend-box-logo-sml.png"/></p>
			</cfoutput>--->
			
			<cfset sendEmail(to=customers.email, 
				subject="Your Weekend Box Is On Its Way!", 
				template="/emails/weekendboxenroute",
				from="Weekend Box Club <hello@weekendboxclub.com>", 
				first_name=customers.firstName)>
		
			<cfoutput>Sent to #customers.firstName# #customers.surname# - #customers.email#<br /></cfoutput>
		</cfloop>
	
				
		
		<cfabort>
	
	</cffunction>

</cfcomponent>