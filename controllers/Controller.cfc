<cfcomponent extends="Wheels">

	<cffunction name="loadSubscriberInstance" access="private">
		
		<!--- Create a new newsletter subscriber instance --->
		<cfset data.subscriber = model("newsletter").new()>
		
	</cffunction>
	
</cfcomponent>