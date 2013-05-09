<cfoutput>
	
	<div class="row">
        <header class="highlight span12">
            <h2>Healthy, Green &amp; Creative <strong>Children's Activities</strong></h2>
            <h3>For little ones aged 3-8, delivered right to your door.</h3>               
            <img id="feature-screenshot" src="./images/weekend-box-logo.png" alt="Weekend Box">           
            <p><a href="##myModal" role="button" class="big-btn" data-toggle="modal">Register for Updates</a></p>
            <p>We'll be launching soon, register your interest above and we'll make sure you're the first to know and we'll even send you a coupon for your first box as a thank you.</p>
            	<nav class="links">   
			        <a href="http://www.twitter.com/weekendboxclub"><img src="images/twitter-icon.png" alt="twitter"></a>
			        <a href="http://www.facebook.com/weekendboxclub"><img src="images/facebook-icon.png" alt="fb"></a>    
			    </nav>   
        </header>        
    </div>	 
	
	<!-- Modal -->
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		#startFormTag(controller="main", action="send", method="post")#
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="myModalLabel">Register for Updates</h3>
			</div>
			<div class="modal-body">
				<p>Pop your name and email in below and we'll keep you posted with updates as well as send you a coupon for your first box.</p>		
				<div class="span3">
					<fieldset>
						<label><strong>Full Name</strong></label>
						<input type="text" name="name" placeholder="Full Name" class="input-medium">
						<label><strong>Email Address</strong></label>
						<input type="text" name="email" placeholder="Email Address">
						<label><strong>What's 3 + 5? (Anti-Robot Question)</strong></label>
						<input type="text" name="captcha" placeholder="3 + 5 = ?" class="input-small">
					</fieldset>
				</div>
				<div class="span2">
					#imageTag('squirrel.png')#
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Register</button>
			</div>
		#endFormTag()#
	</div>

</cfoutput>