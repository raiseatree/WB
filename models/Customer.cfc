<cfcomponent extends="Model" output="false">

	<cffunction name="init">
	
		<cfset hasMany('customerchildren')>
		<cfset belongsTo(name='promocode', joinType='outer')>
	
	</cffunction>

</cfcomponent>