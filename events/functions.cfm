<!--- Place functions here that should be globally available in your application. --->
<cffunction name="GetEncryptKey">
	<cfreturn 'wb052013'>
</cffunction>

<cffunction name="GetGoCardless" hint="I return various variables for use in integrating GoCardless whether in Dev or Prod">
	<cfargument name="variable" type="string" hint="The variable to return">
	
	<!--- 
		Variables are split down by ones that change between Sandbox (Dev) and Live (Prod) environments 
	--->
	<cfswitch expression="#ARGUMENTS.variable#">
	
		<!--- Main API Domain --->
		<cfcase value="gc_url">
			<cfif get("environment") EQ 'Production'>
				<cfreturn 'https://gocardless.com'>
			<cfelse>
				<cfreturn 'https://sandbox.gocardless.com'>
			</cfif>
		</cfcase>
	
		<!--- App Identifier --->
		<cfcase value="app_identifier">
			<cfif get("environment") EQ 'Production'>
				<cfreturn '49C5CHE33CBJG4G8622JWPMSWTMM7SWBYQRE57DR712Y2G24MCP94PBEQ1WJWH7H'>
			<cfelse>
				<cfreturn 'HQG00DNAYVRXVMZXXSVVVSW1E3CKT8C9PR8HQ376MNA9R0D8CMZB85VRFGQBDCQZ'>
			</cfif>
		</cfcase>
	
		<!--- App Secret --->
		<cfcase value="app_secret">
			<cfif get("environment") EQ 'Production'>
				<cfreturn 'QPMF1Q5JC3FEQ5ZM17XJJFNY4JBSGDVRGWPQ9JN34WY079KYYDR1GP2EAMGZ9FTK'>
			<cfelse>
				<cfreturn '47HX6FJG7Y95X0J0EWE0EATQXPQ2AZXC2RADG9E1EA5WXWWKRPA1793V5RP7JFTT'>
			</cfif>
		</cfcase>
	
		<!--- Merchant Access Token --->
		<cfcase value="merchant_access_token">
			<cfif get("environment") EQ 'Production'>
				<cfreturn 'FH4BMGADQVMPRMQ0YQC80KPSWXCHGANBJBEKF8QN14MN92X1HSF1GG6KBQPX21CF'>
			<cfelse>
				<cfreturn 'XHG7PB107A5BKWB4NAMN1QW4EKK3A82003JK37A52V7M5B8BQCXSDKY251APC3F7'>
			</cfif>
		</cfcase>
	
		<!--- Merchant ID (AKA App ID) - Static across environments --->
		<cfcase value="merchant_id">
			<cfreturn '0BM9WRCNEX'>
		</cfcase>
		
		<cfdefaultcase>
			<cfreturn ''>
		</cfdefaultcase>
		
	</cfswitch>

</cffunction>

<cffunction name="GetStripe" hint="I return various variables, depending on whether we're in a test or production environment">
	<cfargument name="variable" type="string" hint="The variable to return">
	
	<!--- 
		Variables are split down by ones that change between Sandbox (Dev) and Live (Prod) environments 
	--->
	<cfswitch expression="#ARGUMENTS.variable#">
	
		<!--- Public Key --->
		<cfcase value="publicKey">
			<cfif get("environment") EQ 'Production'>
				<cfreturn 'pk_live_XW4bkUvTaYUS0PeZ8fBV213Y'>
			<cfelse>
				<cfreturn 'pk_test_A5KeTPJqhXtTdQbWDM7WGTFJ'>
			</cfif>
		</cfcase>
		
		<!--- Secret Key --->
		<cfcase value="secretKey">
			<cfif get("environment") EQ 'Production'>
				<cfreturn 'sk_live_N5Um2pC5HdX6GJXPnNmh1x9h'>
			<cfelse>
				<cfreturn 'sk_test_FEZzrTUz28tuBt3ogatuzYLk'>
			</cfif>
		</cfcase>
	
	</cfswitch>
	
</cffunction>
