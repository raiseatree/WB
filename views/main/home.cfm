<cfoutput>
	
	<div class="row">
        <header class="highlight span12">
            <h2>Healthy, Green &amp; Creative <strong>Children's Activities</strong></h2>
            <h3>Delivered right to your door every week.</h3>               
            <img id="feature-screenshot" src="./images/weekend-box-logo.png" alt="Weekend Box">           
            <p><a href="##myModal" role="button" class="big-btn" data-toggle="modal">Register for Updates</a></p>
            <p>We'll be launching soon, register your interest above to be the first to know.</p>
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
				<p>Pop your name and email in below and we'll keep you posted with updates</p>		
				<fieldset>
					<label><strong>Full Name</strong></label>
					<input type="text" name="name" placeholder="Full Name">
					<label><strong>Email Address</strong></label>
					<input type="text" name="email" placeholder="Email Address">
				</fieldset>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Register</button>
			</div>
		#endFormTag()#
	</div>

</cfoutput>