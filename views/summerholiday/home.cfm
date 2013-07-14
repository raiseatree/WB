<cfoutput>

	<div class="row">
        <header class="highlight span12">
			<h2>6 Weeks of Summer with Weekend Box Club!</h2>
		</header>
	</div>
	
	<br />

	<section class="container">
		
		<div class="highlight row">
			<div class="span6">
				<h2>Entertain Your Children For Just &pound;6 A Week!</h2>
				<h3 class="text-left">Get great creative, healthy and green activities delivered right to your door EVERY WEEK this summer! </h3>
				<p>#linkTo(controller="summerholiday", action="order", text="Get Started Now &raquo;", role="button", class="big-btn register")#</p>
			</div>
			<div class="span6">
				#imageTag('summer-features.png')#
			</div>
		</div>
	
	</section>
	
	<hr>
	
	<section class="container">
		
		<div class="highlight row">
			<h2>Don't Just Take Our Word For It!</h2><br /><br />
			<div id="myCarousel" class="carousel slide">
	            <div class="carousel-inner">
	                <div class="item active">      
	                    <p>#imageTag('summer-quote-1.png')#</p>
	                </div>
	                <div class="item">                	
	                    <p>#imageTag('summer-quote-2.png')#</p>                                              
	                </div>
	                <div class="item">              	  
	                    <p>#imageTag('summer-quote-3.png')#</p>   
	                </div>
	            </div> 
	            <a class="left carousel-control" href="##myCarousel" data-slide="prev">#imageTag('arrow-left.png')#</a>
	            <a class="right carousel-control" href="##myCarousel" data-slide="next">#imageTag('arrow-right.png')#</a>           
	        </div>
		</div>
		
	</section>
	
	<hr>
	
	<section class="container">
		
		<div class="row">
		
			<div class="span6">
				<h2 class="text-left">Big Box. Little Box</h2>
				<h3 class="text-left">Whether you're looking for a few activities or a few more, we've got you covered!</h3>
				<h3 class="text-left">Our Big Box contains 4 activities and our Little Box contains 2 activities.</h3>
				<h3 class="text-left">Activities are different every week!</h3>
			</div>
			<div class="span6">#imageTag('splash-img.png')#</div>
		
		</div>
		
	</section>
	
	<hr>
	
	<!---<section class="container">
		
		<div class="row">
		
			<div class="span6"><br /><br />#imageTag(source='tshirt.png', class="offset1")#</div>
			<div class="span6">
				<h2 class="text-left">FREE T-Shirt!</h2>
				<h3 class="text-left">When you order the Summer Holiday Club Box we''ll send you a FREE Weekend Box T-Shirt as well.</h3>
				<h3 class="text-left">You can specify your child's size at checkout.</h3>
			</div>
		
		</div>
		
	</section>
	
	<hr>--->
	
	<section class="container">
		
		<div class="row">
		
			<div class="span6"><br /><br />#imageTag(source='box-every-week.png', class="img-circle offset1")#</div>
		
			<div class="span6">
				<h2 class="text-left">A Box For Every Week</h2>
				<h3 class="text-left">Keep your little ones busy all summer with engaging activities from Weekend Box!</h3>
				<h3 class="text-left">Each box contains a mix of Arts & Crafts, Child-Friendly Recipes, Seeds/Recycling & Drawing activities.</h3>
			</div>
		
		</div>
		
	</section>
	
	<hr>
	
	<section class="container">
		<div class="row">
	    	<div class="highlight span12">
				<h3>Have you got a question? Feel free to give us a call on 0191 328 0640 or email #mailTo('hello@weekendboxclub.com')# - we'd love to hear from you!</h3>
				<p>#linkTo(controller="summerholiday", action="order", text="Join The Club Now &raquo;", role="button", class="big-btn")#</p>
				<p>Registration takes <strong>1 minute</strong>. That's quicker than it takes to boil the kettle!</p> 
			</div>
		</div>
	</section>
	
</cfoutput>