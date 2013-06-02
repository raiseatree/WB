<cfoutput>

	<div class="row">
        <header class="highlight span12">
			<h2>WIN A 3-Month Weekend Box Subscription (Worth &pound;45!)</h2>
            <h3>For little ones aged 3-8, delivered right to your door.</h3>
		</header>
	</div>
	
	<section class="section-box product-box">
		<div class="container">
			<div class="row">
				<div class="span5">
					 
					 #startFormTag(controller="daisyGreen", action="save", class="form-horizontal")#
	        
			        	<fieldset>
							<legend>Your Details</legend>
							
								<div class="control-group">
									<label class="control-label" for="inputFirstName">Full Name</label>
									<div class="controls">
										#textField(objectName="data.entrant", id="inputFirstName", property="firstName", label="", required="true", placeholder="First Name", class="input-small")# 
										#textField(objectName="data.entrant", property="surname", label="", required="true", placeholder="Surname", class="input-small")#
									</div>
								</div>
									
								<div class="control-group">
									<label class="control-label" for="inputEmail">Email</label>
									<div class="controls">
										#textField(objectName="data.entrant", id="inputEmail", property="email", label="", required="true")# 
										<span class="help-inline">We won't give this out to anyone at all. If you win we will contact you via this address</span>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="inputGender">Gender</label>
									<div class="controls">
										<select id="inputGender" name="entrant[gender]" required="true" class="input-small">
											<option selected="true"></option>
											<option value="male">Male</option>
											<option value="female">Female</option>
										</select>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="inputAge">Age Range</label>
									<div class="controls">
										<select id="inputAge" name="entrant[age]" required="true" class="input-small">
											<option selected="true"></option>
											<option value="18-24">18-24</option>
											<option value="25-34">25-34</option>
											<option value="35-44">35-44</option>
											<option value="45-54">45-54</option>
											<option value="55-64">55-64</option>
											<option value="65+">65+</option>
											<option value="PreferNotToSay">Prefer Not to Say</option>
										</select>
									</div>
								</div>
							
						</fieldset>
						
						<fieldset>
							<legend>Little Ones</legend>
							<div class="control-group">
								<label class="control-label" for="inputChildren">How many <strong>Children</strong> do you have (aged 3-8)?</label>
								<div class="controls">
									<select id="inputChildren" name="entrant[children]" required="true" class="input-small">
										<option selected="true"></option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4+">4+</option>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="inputGrandchildren">How many <strong>Grandchildren</strong> do you have (aged 3-8)?</label>
								<div class="controls">
									<select id="inputGrandchildren" name="entrant[grandchildren]" required="true" class="input-small">
										<option selected="true"></option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4+">4+</option>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="inputNiecesNephews">How many <strong>Nieces or Nephews</strong> do you have (aged 3-8)?</label>
								<div class="controls">
									<select id="inputNiecesNephews" name="entrant[niecesNephews]" required="true" class="input-small">
										<option selected="true"></option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4+</option>
									</select>
								</div>
							</div>
							
							<div class="form-block">
								<div class="control-group">
									<label class="checkbox">
										#checkbox(objectName="data.entrant", property="newsletter", id="inputNewsletter", label="")# Join our <strong>Weekly Newsletter?</strong> (activities, competitions and more!)
									</label>
								</div>
								<button type="submit" class="big-btn">Enter Competition &raquo;</button>
							</div>
					
					#endFormTag()#
					
				</div>
				
				<div class="span7">
					#imageTag(source='splash-img.png')#
				</div>
			</div>
		</div>
	</section>

</cfoutput>