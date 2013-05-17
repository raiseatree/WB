<cfparam name="data">
<cfparam name="params.plan" default="fortnightly">
<cfoutput>

	<div class="row">        	
		<h2>Join The <strong>Weekend Box</strong> Club</h2>
	</div>

	<section class="section-box shadow form">
	    <div class="container">     	
	        
	        #startFormTag(controller="main", action="register", class="form-horizontal")#
	        
	        	<fieldset>
					<legend>Your Details</legend>
					
					<div class="form-block">
						
						<div class="control-group">
							<label class="control-label" for="inputFirstName">Full Name</label>
							<div class="controls">
								#textField(objectName="data.customer", id="inputFirstName", property="firstName", label="", required="true", placeholder="First Name", class="input-small")# 
								#textField(objectName="data.customer", property="surname", label="", required="true", placeholder="Surname", class="input-small")#
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputEmail">Email</label>
							<div class="controls">
								#textField(objectName="data.customer", id="inputEmail", property="email", label="", required="true")# 
								<span class="help-inline">We won't give this out to anyone at all.</span>
							</div>
						</div>
    				</div>
					
				</fieldset>
	
				<fieldset>
					<legend>Your Child's Details</legend>
					
					<div class="form-block">
					
						<div class="well well-small">
							<h4>Multiple Children? No Problem</h4>
							<p>We'll simply add an extra &pound;4.00 per child on to your fortnightly total and include all the extra content you'll need.</p>
							<p><strong>Unfortunately we can't currently handle extra siblings online, please continue with your order and then when complete send us an email on #mailto('hello@weekendboxclub.com')# and we'll update your order.</strong></p>
						</div>
						<br />
						<div class="control-group">
							<label class="control-label" for="inputName">Name</label>
							<div class="controls">
								#textField(objectName="data.child", property="name", label="", required="true", class="input-small")# 
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputGender">Gender</label>
							<div class="controls">
								<select id="inputGender" name="child[gender]" required="true" class="input-small">
									<option selected="true"></option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputDOB">Date of Birth</label>
							<div class="controls">
								#dateSelectTags(name="child[dateofbirth]", id="inputDOB", class="input-small", order="day,month,year", startYear="#year(DateAdd("yyyy",-12,now()))#", endYear="#year(DateAdd("yyyy",-3,now()))#")#
								<span class="help-inline">This makes it easier for us to send you more customised activities</span>
							</div>
						</div>
						
						<!---<div class="control-group">
							<button type="button" class="btn add-sibling">Add Sibling</button>
						</div>--->
						
    				</div>
					
				</fieldset>
	
				<fieldset>
					<legend>Delivery Details</legend>
					
					<div class="form-block">
						
						<div class="control-group">
							<label class="control-label" for="inputAddress">Address</label>
							<div class="controls">
								#textField(objectName="data.customer", id="inputAddress", property="address", label="", required="true")# 
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputAddress2">Address 2</label>
							<div class="controls">
								#textField(objectName="data.customer", id="inputAddress2", property="address2", label="", placeholder="Optional")#
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputTownCity">Town/City</label>
							<div class="controls">
								#textField(objectName="data.customer", id="inputTownCity", property="city", label="", required="true")#
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputCounty">County</label>
							<div class="controls">
								#textField(objectName="data.customer", id="inputCounty", property="county", label="", class="input-small", required="true")#
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputPostCode">Post Code</label>
							<div class="controls">
								#textField(objectName="data.customer", id="inputPostCode", property="postcode", label="", class="input-mini", required="true")#
							</div>
						</div>
						
    				</div>
					
				</fieldset>
				
				<fieldset>
					<legend></legend>
					
					<div class="form-block">
				
						<div class="control-group">
							<label class="control-label" for="inputReferral">Referral Location</label>
							<div class="controls">
								<select name="customer[referralLocation]" id="inputReferral" required="true">
									<option selected="true"></option>
									<option value="SearchEngine">Search Engine - Google, Bing etc</option>
									<option value="Friend">Friend/Colleague/Teacher</option>
									<option value="Press">News Story</option>
									<option value="Flyer">Flyer</option>
									<option value="TwitterFacebook">Twitter/Facebook</option>
									<option value="Other">Other</option>
								</select>
								
								<br /><br />
							
								<div id="referral_name">
									#textField(objectName="data.customer", id="inputReferralName", property="referral", label="", class="input-xlarge", placeholder="Name of Your Friend/Colleague/Teacher")#
									<span class="help-block"><strong>Please enter the name of the person who referred you so we can thank them.</strong></span>
								</div>
							</div>
						</div>
						
					</div>
				
				</fieldset>
	
				<div class="form-block">
					#hiddenField(objectName="data.customer", property="promocodeID")#
					#hiddenFieldTag(name="customer[planname]", value=params.plan)#
					<button type="submit" class="big-btn">Join The Club &raquo;</button>
					<p><i>(We'll take your payment details on the next screen and let you review everything before completing)</i></p>
				</div>
	        
	        #endFormTag()#
	        
		</div>
	</section>

	<script>
		$(document).ready(function() {
			
			/*
			 * Hide the referral name by default 
			*/
			$('##referral_name').hide();
			
			$('##inputReferral').change(function() {
				
				if ($('##inputReferral').val() == 'Friend') {
					$('##referral_name').show();
				}
			});
		});
	
	</script>

</cfoutput>