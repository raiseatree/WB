<cfoutput>

	<div class="row">
        <header class="highlight span12 clearfix">
			<h2>WIN A Swingball Set or Bananagrams! (Worth &pound;40!)</h2>
			<h3>Thanks to Weekend Box and Conquer Maths!</h3>
		</header>
		<div class="span12">
			#imageTag(source='conquer-maths.jpg', class="pull-right")#
			<p>To celebrate the launch of Weekend Box, we're giving away &pound;40 of prizes including a Classic Swingball and a copy of Bananagrams!</p>
			<p>Weekend Box is a new service that helps you have AMAZING weekends with your children by delivering a fun-filled box of creative, green and healthy activities for children aged 3-8 right to your door.</p>
			<p>Since everything's included in your Weekend Box (even glue!), you just need to add excitement for an amazing weekend full of fun with your children!</p>
			<p>To enter the competition, simply answer the following question:</p>
			<p><strong>Which of these would you NOT find in a Weekend Box?</strong></p>
			<ol>
				<li><strong>Creative Activities</strong> (with everything you need - even glue)</li>
				<li><strong>Healthy Recipes</strong> (with Special Ingredients)</li>
				<li><strong>Jelly</strong> (the wibbly-wobbly variety)</li>
				<li><strong>Green Activities</strong> (with seeds, compost and instructions to make a recycled plant pot)</li>
			</ol>
		</div>
	</div>
	
	<section class="section-box product-box">
		<div class="container">
			<div class="row">
				<div class="span5">
					 
					 #startFormTag(controller="conquermaths", action="save", class="form-horizontal")#
	        
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
									<label class="control-label" for="inputEmail">Your Answer</label>
									<div class="controls">
										<span class="help-inline"><strong>Which of these would you NOT find in a Weekend Box?</strong></span>
										<select name="entrant[answer]">
											<option></option>
											<option value="creative">Creative Activities (with everything you need - even glue)</option>
											<option value="healthy">Healthy Recipes (with Special Ingredients)</option>
											<option value="jelly">Jelly (the wibbly-wobbly variety)</option>
											<option value="green">Green Activities (with seeds, compost and instructions to make a recycled plant pot)</option>
										</select>
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
								#hiddenField(objectName="data.entrant", property="source")#
								<button type="submit" class="big-btn">Enter Competition &raquo;</button>
							</div>
					
					#endFormTag()#
					
					<h4>Competition Rules</h4>
					<ul>
						<li>Closing date: Tuesday 2nd July 6pm (BST)</li>
						<li>Only ONE entry per person (multiple entries will be discarded)</li>
						<li>The winner will be contacted by Weekend Box and asked to confirm their postal address and availability for this prize. Once confirmed, we will send the winner's first box within 30 days.</li>
					</ul>
					
				</div>
				
				<div class="span7">
					<h2>Weekend Box Club</h2>
					<h3>The Most Exciting Weekend You'll Have This Side of Christmas</h3>
					#imageTag(source='splash-img.png')#
				</div>
			</div>
		</div>
	</section>

</cfoutput>