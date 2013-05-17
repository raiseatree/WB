<!---
	The environment setting can be set to "design", "development", "testing", "maintenance" or "production".
	For example, set it to "design" or "development" when you are building your application and to "production" when it's running live.
--->

<cfif FindNoCase('weekendbox.local', CGI.SERVER_NAME) GT 0>
	<cfset set(environment="development")>
<cfelse>
	<cfset set(environment="production")>
</cfif>