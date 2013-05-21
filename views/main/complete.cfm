
<cfoutput>

	<div class="row">
		
		<h2>Woo Hoo! Welcome to <strong>Weekend Box Club</strong>!</h2>
		<h3>Next Steps:</h3>
		
		<section class="section-box complete-box shadow">
		    <div class="container">     	
		        <div class="row">
		            <article class="span4 center-align">
		            	#imageTag('email.png')#
		            	<h3>Check your email</h3>
		            	<p>We've sent you an email with all the important details like when your first box will arrive.</p>
		            </article>
		            
		             <article class="span4 center-align">
			             #linkTo(href="http://www.facebook.com/weekendboxclub", target="_blank", text=imageTag('fb-mid.png'))# 
			             #linkTo(href="http://www.twitter.com/weekendboxclub", target="_blank", text=imageTag('twitter-mid.png'))# 
		            	<h3>Join us on #linkTo(href="http://www.facebook.com/weekendboxclub", target="_blank", text="Facebook")# &amp; #linkTo(href="http://www.twitter.com/weekendboxclub", target="_blank", text="Twitter")#</h3>
		            	<p>Keep up to date with bonus activities, latest news and offers via our Facebook &amp; Twitter pages.</p>
		            </article>
		            
		             <article class="span4 center-align">
			             #imageTag('red-box.png')#
		            	<h3>Invite your friends</h3>
		            	<p>For <strong>every friend</strong> you refer, we'll send you an extra Craft Kit in your next box or you can donate the Craft Kit to our #linkTo(controller="main", action="about", anchor="christmas", text="Christmas Box Appeal")#</p>
		            </article>
		            
				</div>
			</div>
		</section>
		
			<!--- 
				1. Check your email
				2. Join us on Facebook and Twitter
				3. Get excited!
			--->
	</div>

</cfoutput>