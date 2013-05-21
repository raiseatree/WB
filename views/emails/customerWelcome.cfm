<cfparam name="data">

<cfoutput>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="http://www.weekendboxclub.com/stylesheets/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="http://www.weekendboxclub.com/stylesheets/bootstrap-responsive.min.css" />
		<link rel="stylesheet" type="text/css" href="http://www.weekendboxclub.com/stylesheets/strip.css" />
		<link rel="stylesheet" type="text/css" href="http://www.weekendboxclub.com/stylesheets/strip-responsive.css" />
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,600" rel="stylesheet">
	    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,700' rel='stylesheet' type='text/css'>
	</head>
	
	<body>
	
		<section class="container">
			<a href="http://www.weekendboxclub.com" class="offset4 span3"><img src="http://www.weekendboxclub.com/images/weekend-box-logo-sml.png" alt="Weekend Box Logo" /></a>
		</section>
	
		<section class="container">
		
			<div class="row">
		        <header class="highlight span12">
		            <h2>Welcome to Weekend Box, #data.firstName#!</h2>
		            <h3>We've received your order and are preparing your first box now.</h3>               
				</header>
			</div>
		
			<div class="row">
				
				<div class="span9">
				
					<h4>Next Steps:</h4>
					
					<article class="clearfix">
			            <img src="http://www.weekendboxclub.com/images/red-box.png" class="pull-left span3">
			            <div class="span5">
			            	<h5>Invite your friends</h5>
			            	<p>For <strong>every friend</strong> you refer, we'll send you an extra Craft Kit in your next box <strong>or</strong> you can donate the Craft Kit to our <a href="http://www.weekendboxclub.com/main/about##christmas">Christmas Box Appeal</a></p>
			            	<p><strong>Forward this email to them and remind them to mention your name when signing up.</strong></p>
			            </div>
		            </article>
		            
		            <hr>
					
		            <article class="clearfix">
			            <div class="span3">
			            	<a href="http://www.facebook.com/weekendboxclub"><img src="http://www.weekendboxclub.com/images/fb-mid.png" alt="Facebook Logo" class="pull-right span1"></a>
				            <a href="http://www.twitter.com/weekendboxclub"><img src="http://www.weekendboxclub.com/images/twitter-mid.png" alt="Twitter Logo" class="pull-right span1"></a>
						</div>
						<div class="span5">
				            <h5>Join us on #linkTo(href="http://www.facebook.com/weekendboxclub", target="_blank", text="Facebook")# &amp; #linkTo(href="http://www.twitter.com/weekendboxclub", target="_blank", text="Twitter")#</h5>
			            	<p>Keep up to date with bonus activities, latest news and offers via our Facebook &amp; Twitter pages.</p>
			            	<p><a href="http://www.facebook.com/weekendboxclub">Weekend Box on Facebook</a></p>
			            	<p><a href="http://www.twitter.com/weekendboxclub">Weekend Box on Twitter</a></p>
			            </div>
		            </article>
		            
		            <hr>
					
		            <article class="clearfix">
			            <img src="http://www.weekendboxclub.com/images/andy-stephenson.jpg" class="img-circle pull-left span3" />
			            <div class="span5">
				            <h5>Let me know what you think</h5>
			            	<p>I'm always looking for ways to improve your Weekend Boxes - feel free to drop me a line if you have any feedback or ideas you'd like to see.</p>
			            	<p>You can reply directly to this email, Tweet us (<a href="http://www.twitter.com/weekendboxclub">@WeekendBoxClub</a>) or send us a message through Facebook (<a href="http://www.facebook.com/weekendboxclub">/WeekendBoxClub</a>).</p>
			            	<p>Cheers, Andy </p>
			            	<p><strong>Founder, Weekend Box Club</strong></p>
			            </div>
		            </article>
		            
		            <hr>
					
					<h4>Frequently Asked Questions</h4>
					#includePartial('/main/faqs')#
					
				</div>
				
				<aside class="span3">
					<div class="alert alert-success">
						<p><strong>First Box Arrival Date (Estimate)</strong></p>
						<p><i class="icon-calendar"></i> <cfif IsDate(start_at)>#DateFormat(DateAdd("d", 4, start_at), "dddd dd mmmm yyyy")#<cfelse>#start_at#</cfif></p>
					</div>
				
					<div class="alert alert-info">
						<p>Have a question? We're here to help!</p>
						<p><strong>Telephone:</strong><br />0191 328 0640</p>
						<p><strong>Email:</strong> Just hit Reply!</p>
					</div>
				</aside>
			
			</div>
		
		</section>
	
	</body>

</html>


</cfoutput>