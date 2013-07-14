<cfparam name="publicKey">

<cfoutput>
	
	<div class="row">        	
		<h2>Join The <strong>Weekend Box</strong> Club</h2>
	</div>

	<section class="section-box shadow form">
	    <div class="container">    

			#startFormTag(controller="main", action="stripeProcess", method="POST")#
				
				<fieldset>
					<legend>Your Details</legend>
					
					<div class="form-block">
						
						<div class="control-group">
							<label class="control-label" for="inputEmail">Email</label>
							<div class="controls">#textFieldTag(name="email", id="inputEmail", required="yes", value="andystephenson88@gmail.com")#</div>
						</div>
						
					</div>
					
				</fieldset>

				<div class="form-block">	

					<script
						src="https://checkout.stripe.com/v2/checkout.js" class="stripe-button"
						data-key="#publicKey#"
						data-amount="2000"
						data-name="Demo Site"
						data-description="2 widgets ($20.00)"
						data-image="/128x128.png">
					</script>
					
				</div>
				
			#endFormTag()#
			
		</div>
		
	</section>

</cfoutput>