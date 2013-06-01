<cfcomponent extends="Controller" output="false">

	<cffunction name="init">
	
		<cfset filters(through="loadSubscriberInstance")>
	
	</cffunction>
	
	<cffunction name="complete"></cffunction>
	
	<cffunction name="enter">
	
		<!--- Create a new competition entrant instance --->
		<cfset data.entrant = model("entrant").new()>
	
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
			
			<!--- TODO Now mail through the confirmation of entry and the Patchwork Letters activity --->
			
			<!--- Flash and forward --->
			<cfset flashInsert(success="Thanks for entering the competition!")>
			<cfset redirectTo(controller="daisyGreen", action="complete")>
		
		</cfif>
	
	
	</cffunction>

</cfcomponent>