<cfoutput>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title>Weekend Box - A Weekly Box of Healthy Living, Green &amp; Creative Activities for Children Aged 3-8 Delivered to Your Door</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    
	    #stylesheetLinkTag('bootstrap,bootstrap-responsive,strip,strip-responsive')#
	    
	    
	   	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600" rel="stylesheet">
	    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,700' rel='stylesheet' type='text/css'>
	</head>
	<body>
	
		<!--- Display any flash messages --->
		<cfif NOT flashIsEmpty()>
			<section class="container">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					#flash("success")#
				</div>
			</section>
		</cfif>
		
		<section class="container">
		    <nav class="navbar">
		        <div class="navbar-inner">
		            <div class="container">
		                <ul class="nav">
		                    <li class="active"><a href="##">Home</a></li>
		                    <li>#linkTo(controller="main", action="about", text="About")#</li>
		                    <li>#mailTo(emailAddress='hello@weekendboxclub.com', name="Contact")#</li>
		                </ul>
		            </div>
		        </div>
		    </nav>
		</section>
		
		<section class="container">
			#includeContent()#
		</section>
				
		<script src="./javascripts/jquery-1.8.0.min.js"></script>
		<script src="./javascripts/bootstrap.js"></script>
		
		<!--  Google Analytics -->
		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-40603633-1']);
			_gaq.push(['_setDomainName', 'weekendboxclub.com']);
			_gaq.push(['_setAllowLinker', true]);
			_gaq.push(['_trackPageview']);
			
			(function() {
			  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();
		</script>
		
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
		
	</body>
</html>
</cfoutput>