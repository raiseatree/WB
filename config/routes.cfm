<!---
	Here you can add routes to your application and edit the default one.
	The default route is the one that will be called on your application's "home" page.
--->
<cfset addRoute(name="home", pattern="", controller="main", action="home")>
<cfset addRoute(name="christmas", pattern="christmas-box-appeal", controller="main", action="christmasBoxAppeal")>
<cfset addRoute(name="summer", pattern="summer", controller="summerholiday", action="home")>