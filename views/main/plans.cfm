<cfoutput>

	<div class="container">

		<br /><br /><div class="row">
			
			<aside class="span3">
				<ul class="nav nav-list">
					<li class="nav-header">Contact Us</li>
					<li><a href="##"><i class="icon-bullhorn"></i> +44(0)191 512 0640</a></li>
					<li><a href="mailTo:hello@weekendboxclub.com"><i class='icon-envelope'></i> hello@weekendboxclub.com</a></li>
				</ul>
			</aside>
			

					<div class="plans text-center">
						<div class="span3">
							<h5 class="plan-name">One-Off</h5>
							<h1 class="plan-price">&pound10</h1>
							<span class="muted">per box</span>
			
							<ul class="unstyled plan-features">
								<li>4 Activities</li>
								<li>Everything you need</li>
								<li>100% Recyclable/Reusable</li>
								<li>FREE Delivery (usually next day)</li>
								<li><strong>Great first-time box</strong></li>
							</ul>
			
							#linkTo(controller="main", action="order", params="plan=one-off", text="Buy One-Off Box", class="btn btn-block btn-large")#
						</div>
						<div class="span3 preferred-plan">
							<h5 class="plan-name">Fortnightly Subscription</h5>
			
							<h1 class="plan-price">&pound;8</h1>
							<span class="muted">per fortnight</span>
			
							<ul class="unstyled plan-features">
								<li><strong>FREE Wall Planner</strong></li>
								<li>4 Activities</li>
								<li>Everything you need</li>
								<li>100% Recyclable/Reusable</li>
								<li>FREE Delivery</li>
								<li><strong>Most Popular Plan</strong></li>
							</ul>
			
							#linkTo(controller="main", action="order", params="plan=fortnightly", text="Buy Fortnightly Boxes", class="btn btn-block btn-large btn-success", style="color:##FFF")#
						</div>
						<div class="span3">
							<h5 class="plan-name">Monthly Subscription</h5>
							
							<h1 class="plan-price">&pound;15</h1>
							<span class="muted">per month</span>
			
							<ul class="unstyled plan-features">
								<li>2 Boxes</li>
								<li>4 Activities</li>
								<li>Everything you need</li>
								<li>FREE Delivery</li>
								<li><strong>Best Value Plan</strong></li>
							</ul>
			
							#linkTo(controller="main", action="order", params="plan=monthly", text="Buy Monthly Boxes", class="btn btn-block btn-large")#
						</div>
					
					</div>
					
				</div>
				
			</div>
				
		</div>

	</div>

</cfoutput>