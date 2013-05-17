<cfoutput>
	
	<div class="row">
        <header class="highlight span12">
            <h2>Healthy, Green &amp; Creative <strong>Children's Activities</strong></h2>
            <h3>For little ones aged 3-8, delivered right to your door.</h3>               
		</header>
	</div>
	
	<section class="section-box product-box">
		<div class="container">
			<div class="row product-splash">
				<div class="span5">
					#imageTag(source='product-facts.png')#
					<p>#linkTo(controller="main", action="plans", text="Get Started Now &raquo;", role="button", class="big-btn register")#</p>
					<p class="text-center">
						<a href="##giftCode" role="button" data-toggle="modal">Promo/Gift Code? Enter it here!</a>
						<div class="addthis_toolbox addthis_default_style offset1">
							<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
							<a class="addthis_button_tweet"></a>
							<a class="addthis_counter addthis_pill_style"></a>
						</div>
					</p>
				</div>
				
				<div class="span7">
					#imageTag(source='splash-img.png')#
				</div>
			</div>
		</div>
	</section>
	
	<section class="section-box shadow">
	    <div class="container">     	
	        <div class="row">        	
	            <article class="span4 center-align">					
	                #imageTag(source='parent-child.jpg', class="img-circle")#
	                <h3>What's In The Box?</h3>
	                <p>4 Healthy, Green &amp Creative activities to complete with your little ones. Different activities every fortnight.<br /><strong>Just add passion and inspiration!</strong></p>
	                <p>#linkTo(controller="main", action="exampleBox", text="View the Weekend Box Contents &raquo;")#</p>
	            </article>
	            <article class="span4 center-align">
	                #imageTag(source='grandparents-child.jpg', class="img-circle")#
	                <h3>Gifting A Subscription</h3>
	                <p>Looking to purchase a Weekend Box subscription as a gift? We offer 3, 6 or 12 Month subscriptions.<br /><strong>Birthday's, Christmas and More!</strong></p>
	                <p>#mailTo(emailAddress="hello@weekendbox.com", encode="true", name="Contact us about Gifting a Subscription &raquo;")#</p>
	                
	            </article>
	            <article class="span4 center-align">
	               #imageTag(source='crafted-with-love.jpg', class="img-circle")#
	                <h3>Crafted With Love</h3>
	                <p>100% of the Weekend Box contents are reusable or recyclable; 95% come from recycled material.<br /> <strong>(we're currently working on the other 5%)</strong></p>
	                <p>#linkTo(controller="main", action="about", text="Find out about our Philosophy &raquo;")#</p>
	            </article>                    	
	   		</div>
	    </div>   
	</section>
	
	<section class="section-box shadow">
	    <div class="container">     	
	        <div class="row">        	
	            <article class="offset1 span10">
					<p><strong>Weekend Box is a revolutionary new concept for having Healthy, Green and Creative activities for your children aged 3-8 delivered right through your door every fortnight.</strong></p>
					<p>Each box contains 4 categories: Something to EAT (a healthy recipe with accompanying secret ingredient), Something to MAKE (a craft kit with all the materials required), Something GREEN (some seasonal seeds to plant or something to make with recycling/rubbish material) and Something to READ or WRITE (a creative story writing game, for example).</p>
					<p>Our boxes are sent out (with free delivery) in time for the weekend every fortnight and since everything's included in the box, you can focus on spending time having fun with your little ones.</p>
					<p>#linkTo(controller="main", action="exampleBox", text="Have a look at our Example Weekend Box &raquo;", class="btn")#</p>
				</article>
			</div>
		</div>
	</section>
	
	<section class="container">
		<div class="row">
	    	<div class="highlight span12">
				<p>#linkTo(controller="main", action="order", text="Join The Club Now &raquo;", role="button", class="big-btn")#</p>
	            <p>Registration takes <strong>1 minute</strong>. That's quicker than it takes to boil the kettle!</p>    
			</div>
		</div>
	</section>

<!---<section class="container">
	<div class="row">
        <div class="offset3 span6">
            <hr class="shadow-line"/>
        </div>
    </div>
	<div class="row">
    	<div class="highlight span12">
            <h3>With <strong>LandingStrip</strong>, you can tell visitors who your customers are.</h3> 
            <h3 class="subhead">Your <strong>App</strong> is used by people all over the world.</h3> 
            <!---<div class="logo-list">
            	<img src="./img/logoplaceholder.png" alt="companyA"/>
                <img src="./img/logoplaceholder.png" alt="companyA"/>
                <img src="./img/logoplaceholder.png" alt="companyA"/>
                <img src="./img/logoplaceholder.png" alt="companyA"/>
                <img src="./img/logoplaceholder.png" alt="companyA"/>
                <img src="./img/logoplaceholder.png" alt="companyA"/>
            </div>   --->         
        	<p><a href="##" class="big-btn">Get Started Now &raquo;</a></p>            
            <p>Last chance to invite your visitors to your <strong>App</strong>. Try it out, it's free.</p>                      
	    </div>
    </div>
</section>--->
               
	<!-- Gift Code Modal -->
	<div id="giftCode" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		#startFormTag(controller="main", action="plans", method="post")#
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
				<h3 id="myModalLabel">Enter Gift/Promotional Code</h3>
			</div>
			<div class="modal-body">
				<p>Enter your gift code below and we'll get your account set up straight away!</p>		
				<div class="span3">
					<fieldset>
						<label><strong>Gift/Promotional Code</strong></label>
						<input type="text" name="promoCode" placeholder="Enter your gift/promo code here!" class="input-large">
					</fieldset>
				</div>
				<div class="span2">
					#imageTag('squirrel.png')#
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Get Started &raquo;</button>
			</div>
		#endFormTag()#
	</div>

</cfoutput>