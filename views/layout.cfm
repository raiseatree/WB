<cfoutput>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title>Weekend Box - A Fortnightly Box of Healthy Living, Green &amp; Creative Activities for Children Aged 3-8 Delivered to Your Door</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    #stylesheetLinkTag('bootstrap.min,bootstrap-responsive.min,strip,strip-responsive')#
	   	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600" rel="stylesheet">
	    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,700' rel='stylesheet' type='text/css'>
	    
	    <!--- Plans Styles --->
	    <link href="/stylesheets/screen.css" media="screen, projection" rel="stylesheet" type="text/css" />
		<link href="/stylesheets/print.css" media="print" rel="stylesheet" type="text/css" />
		<!--[if IE]>
			<link href="/stylesheets/ie.css" media="screen, projection" rel="stylesheet" type="text/css" />
		<![endif]-->
	    
	    <!--- Defined here so pages can use jQuery --->
	    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	</head>
	<body>
		
		<section class="container">
			<nav class="navbar">
		        <div class="navbar-inner">
		            <div class="container">
						#linkTo(route="home", text=ImageTag(source='weekend-box-logo-sml.png', alt='Weekend Box'), class="brand")#
		                <ul class="nav">
		                    <li>#linkTo(route="home", text="Home")#</li>
		                    <li>#linkTo(controller="main", action="about", text="About")#</li>
		                    <!---<li>#linkTo(href="http://BLOG_URL_HERE", text="Blog")#</li>--->
		                    <li>#linkTo(controller="main", action="faqs", text="FAQs")#</li>
		                    <!---<li>#linkTo(controller="main", action="joinUs", text="Join Us!")#</li>--->
		                    <li class="active">#linkTo(controller="main", action="order", text="Join The Club!")#</li>
		                    <li>#mailTo(emailAddress='hello@weekendboxclub.com', name="Contact")#</li>
		                </ul>
		            </div>
		        </div>
		    </nav>
		</section>
		
		<!--- Display any flash messages --->
		<cfif NOT flashIsEmpty()>
			<section class="container">
				<div class="alert alert-<cfif flashKeyExists("success")>success<cfelseif flashKeyExists("error")>error</cfif>">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<cfif flashKeyExists("success")>#flash("success")#<cfelseif flashKeyExists("error")>#flash("error")#</cfif>
				</div>
			</section>
		</cfif>
		
		<section class="container">
			#includeContent()#
		</section>
		
		<footer class="container footer-box">   
			
			<hr class="shadow-line" />         
			<nav class="links">             
			    #linkTo(route="home", text="Home")#
			    #linkTo(controller="main", action="home", text="About")#
				<!---#linkTo(href="http://BLOG_URL_HERE", text="Blog")#--->
				#linkTo(controller="main", action="faqs", text="FAQs")#
				#linkTo(controller="main", action="order", text="Join The Club!", class="active")#           
				#mailTo(emailAddress='hello@weekendboxclub.com', name="Contact")# 
			</nav>  
			<nav class="links">   
			    <a href="http://www.twitter.com/weekendboxclub">#imageTag(source='twitter-icon.png', alt="twitter")#</a>
				<a href="http://www.facebook.com/weekendboxclub">#imageTag(source='facebook-icon.png', alt="facebook")#</a>   
			</nav>                 
			
		</footer>
				
		#javascriptIncludeTag('bootstrap.min')#
		
		<!--- Include Google Analytics --->
		#googleAnalyticsTag()#
		
		<!-- UserVoice JavaScript SDK (only needed once on a page) -->
		<script>(function(){var uv=document.createElement('script');uv.type='text/javascript';uv.async=true;uv.src='http://widget.uservoice.com/Ifme2BWSqMrgntr1C864A.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(uv,s)})()</script>
		
		<!-- A tab to launch the Classic Widget -->
		<script>
		UserVoice = window.UserVoice || [];
		UserVoice.push(['showTab', 'classic_widget', {
		  mode: 'full',
		  primary_color: '##cc6d00',
		  link_color: '##007dbf',
		  default_mode: 'support',
		  forum_id: 205088,
		  tab_label: 'Feedback & Support',
		  tab_color: '##fbaf4b',
		  tab_position: 'middle-right',
		  tab_inverted: false
		}]);
		</script>
		
		<!--- Add This --->
		<script type="text/javascript">var addthis_config = {"data_track_addressbar":true, "ui_use_css" : true};</script>
		<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js##pubid=ra-518d665a23c7538c"></script>
		
					
		
	</body>
</html>
</cfoutput>