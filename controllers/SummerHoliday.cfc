<cfcomponent extends="Controller" output="false">

	<cffunction name="calcDeliveryDate" access="private" hint="I calculate when the box should arrive by">
	
		<!--- Add 7 days for delivery --->
		<cfset delDate = DateAdd("d",7,now())>
		
		<!--- Check if the day we calculated was a weekend --->
		<cfif DayOfWeek(delDate) EQ 7> <!--- Saturday --->
			<cfset delDate = DateAdd("d",2,now())>
		</cfif>
		
		<cfif DayOfWeek(delDate) EQ 1> <!--- Sunday --->
			<cfset delDate = DateAdd("d",1,now())>
		</cfif>
		
		<cfreturn delDate>
	
	</cffunction>

	<cffunction name="init">
	
		<cfset filters(through="loadSubscriberInstance")>
		
	</cffunction>
	
	<cffunction name="redeem" hint="Used for NEOffers.co.uk Summer Holiday Box">
	
		<cfset data.redeemer = model("redeemer").new()>
		<cfset data.child = model("redeemerchildren").new()>
	
	</cffunction>

	<cffunction name="save">
	
		<cfif IsPost()>
		
			<!--- Add the info --->
			<cfset addRedeemer = model("redeemer").create(params.redeemer)>
			
			<cfif addRedeemer.hasErrors()>
				<cfset flashInsert(error="Sorry an error occurred: #addRedeemer.allErrors()[1]#")>
				<cfset redirectTo(back=true)>
			</cfif>
			
			<!--- Add the redeemer ID to the child --->
			<cfset params.child.redeemerID = addRedeemer.ID>
			
			<!--- Add the child --->
			<cfset addChild = model("redeemerchildren").create(params.child)>
			
			<cfif addChild.hasErrors()>
				<cfset flashInsert(error="Sorry an error occurred: #addChild.allErrors()[1]#")>
				<cfset redirectTo(back=true)>
			</cfif>
			
			<!--- Mail out to the customer and the mothership --->
			<cfset sendEmail(to=params.redeemer.email, 
					template="/emails/summerHolidayWelcome",
					from="Weekend Box Club <hello@weekendboxclub.com>", 
					bcc="andystephenson88@gmail.com", 
					subject="Woo Hoo! Welcome to Weekend Box Club",
					redeemer=params.redeemer, child=params.child, start_at=calcDeliveryDate())>
		
			<!--- Forward the user to the complete page --->
			<cfset redirectTo(controller="summerHoliday", action="complete")>
		
		</cfif>
	
	
	</cffunction>

</cfcomponent>