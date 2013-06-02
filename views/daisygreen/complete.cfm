<cfoutput>

	<div class="row">
		
		<h2>Thanks for entering the competition!</h2>
		<h3>Please check your email and click the link to confirm your entry.</h3>    
		
		<hr>
		
		<div class="row">
			<div class="span6">
            	<h2>SPECIAL OFFER!</h2>
				<h3>Thank you for entering our competition - order a Weekend Box now for just &pound;5!</h3>
            	#linkTo(controller="daisyGreen", action="purchase", text="Buy A Weekend Box for &pound;5 &raquo;", params="code=#params.code#", class="btn btn-success btn-large btn-block", style="color: ##FFF;")#  
				<h5 class="center-align">Includes FREE Delivery (Saving up to 50%!)</h5>
			</div>
			<div class="span6">#imageTag('splash-img.png')#</div>
		</div>
		
		
		<section class="section-box complete-box shadow">
		    <div class="container">     	
		        <div class="row">
			        
			        <article class="span4 center-align">
		            	#imageTag('email.png')#
		            	<h3>Check your email</h3>
		            	<p>We've sent you a link you need to click on to confirm your competition entry</p>
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
		
	</div>

</cfoutput>