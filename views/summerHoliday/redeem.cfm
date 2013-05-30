<cfparam name="data">

<cfoutput>
	
	<div class="row">        	
		<h2>Redeem your <strong>Summer Holiday Weekend Box</strong>!</h2>
	</div>

	<section class="section-box shadow form">
	    <div class="container">     	
	        
	        #startFormTag(controller="summerHoliday", action="save", class="form-horizontal")#
	        
	        	<fieldset>
					<legend>Your Details</legend>
					
					<div class="form-block">
						
						<div class="control-group">
							<label class="control-label" for="inputFirstName">Full Name</label>
							<div class="controls">
								#textField(objectName="data.redeemer", id="inputFirstName", property="firstName", label="", required="true", placeholder="First Name", class="input-small")# 
								#textField(objectName="data.redeemer", property="surname", label="", required="true", placeholder="Surname", class="input-small")#
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputEmail">Email</label>
							<div class="controls">
								#textField(objectName="data.redeemer", id="inputEmail", property="email", label="", required="true")# 
								<span class="help-inline">We won't give this out to anyone at all.</span>
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputEmail">NEOffers.co.uk Voucher Code:</label>
							<div class="controls">
								#textField(objectName="data.redeemer", id="code", property="code", label="", required="true")# 
								<span class="help-inline">This will be on the confirmation email you received after purchasing from NEOffers.co.uk</span>
							</div>
						</div>
    				</div>
					
				</fieldset>
	
				<fieldset>
					<legend>Your Child(ren)'s Details</legend>
					
					<div class="form-block">
					
						<div class="control-group">
							<label class="control-label" for="inputName">Name(s)</label>
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
						
    				</div>
					
				</fieldset>
	
				<fieldset>
					<legend>Delivery Details</legend>
					
					<div class="form-block">
						
						<div class="control-group">
							<label class="control-label" for="inputAddress">Address</label>
							<div class="controls">
								#textField(objectName="data.redeemer", id="inputAddress", property="address", label="", required="true")# 
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputAddress2">Address 2</label>
							<div class="controls">
								#textField(objectName="data.redeemer", id="inputAddress2", property="address2", label="", placeholder="Optional")#
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputTownCity">Town/City</label>
							<div class="controls">
								#textField(objectName="data.redeemer", id="inputTownCity", property="city", label="", required="true")#
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputCounty">County</label>
							<div class="controls">
								#textField(objectName="data.redeemer", id="inputCounty", property="county", label="", class="input-small", required="true")#
							</div>
						</div>
							
						<div class="control-group">
							<label class="control-label" for="inputPostCode">Post Code</label>
							<div class="controls">
								#textField(objectName="data.redeemer", id="inputPostCode", property="postcode", label="", class="input-mini", required="true")#
							</div>
						</div>
						
    				</div>
					
				</fieldset>
	
				<div class="form-block">
					<button type="submit" class="big-btn">Redeem Voucher &raquo;</button>
				</div>
	        
	        #endFormTag()#
	        
		</div>
	</section>


</cfoutput>