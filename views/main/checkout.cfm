<cfparam name="data">
<cfoutput>

	<div class="row">
		
		<h2>Weekend Box Payment</h2>
		<h3>Please fill in your billing details below so we can send you your first box!</h3>
		
		<aside class="span4">
			
			<h4>Delivery Address</h4>
			<p><strong>#data.customer.name#</strong><br />#data.customer.address#<br /><cfif data.customer.address2 GT ''>#data.customer.address2#<br /></cfif>#data.customer.city#<br />#data.customer.postcode#</p>
		
			<h4>First Box Arrival Date (Estimate)</h4>
			<p><i class="icon-calendar"></i> <cfif IsDate(data.payment.start_at)>#DateFormat(DateAdd("d", 4, data.payment.start_at), "dddd dd mmmm yyyy")#<cfelse>#data.payment.start_at#</cfif></p>

			<div class="alert alert-info">
				<h4>Any Questions?</h4>
				<p>We'd love to hear from you!</p>
				<p><strong>Telephone:</strong><br />0191 328 0640</p>
				<p><strong>Email:</strong><br />#mailto('hello@weekendboxclub.com')#</p>
			</div>
			
			<div class="alert">
				<h4>FAQs</h4>
				#includePartial('faqs')#
			</div>
		
		</aside>
		
		<section class="span8">
			
			<div class="tabbable">
				<ul class="nav nav-tabs">
					<cfif data.directDebit EQ true><li class="active"><a href="##tab1" data-toggle="tab">Direct Debit</a></li></cfif>
					<li<cfif data.directDebit EQ false> class="active"</cfif>><a href="##tab2" data-toggle="tab">Credit/Debit Card</a></li>
				</ul>
				<div class="tab-content">
					<cfif data.directDebit EQ true>
						<div class="tab-pane <cfif data.directDebit EQ true>active</cfif>" id="tab1">
							<div class="span7 dd-box">
								<h3>Direct Debit</h3>
								<ul class="tick-list">
									<li>Quicker to setup</li>
									<li>Greater flexibility and control (for you)</li>
									<li>Costs us less (so we can create better activities)</li>
								</ul>
								
								<form action="#data.payment.url#" method="POST">
								
									<div class="checkout-btn">
						        		<p><input class="btn btn-success btn-large" name="commit" type="submit" value="Setup Direct Debit &raquo;" /></p>
										<p><span class="help-block"><strong>Takes 30 Seconds. 100% Secure</strong></span></p>
									</div>
								
								</form>
								
								<p>#imageTag(source='padlock.png', class="padlock")# Our Direct Debits are provided by GoCardless, who are backed by the Royal Bank of Scotland and are completely secure.</p>
								<br />
							</div>
						</div>
					</cfif>
					
					<div class="tab-pane <cfif data.directDebit EQ false>active</cfif>" id="tab2">
						<div class="span7 card-box">
							<h3>Credit/Debit Card</h3>
							<p>Our Credit/Debit card payments are handled securely by PayPal. </p>
							<p><strong>Please Note:</strong> The merchant's name will be displayed as '<strong>RAISE A TREE LTD</strong>'. Click the button below to set up your subscription:</p>
		
							<!--- Check if we have a custom (PROMO) PayPal Code --->
							<cfif IsDefined("data.customer.code") AND data.customer.code GT ''>
								
								<cfif data.customer.planName EQ 'one-off'>
									#data.customer.paypaloneoff#
								<cfelseif data.customer.planName EQ 'monthly'>
									<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
										<input type="hidden" name="cmd" value="_s-xclick">
										<input type="hidden" name="hosted_button_id" value="#data.customer.paypalcodemonthly#">
										<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal Ð The safer, easier way to pay online.">
										<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
									</form>
								<cfelse>
									<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
										<input type="hidden" name="cmd" value="_s-xclick">
										<input type="hidden" name="hosted_button_id" value="#data.customer.paypalcodefortnightly#">
										<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal Ð The safer, easier way to pay online.">
										<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
									</form>
								</cfif>
							
							<cfelse>
		
								<!--- Switch through PayPal Buttons --->
								<cfswitch expression="#data.customer.planName#">
									<cfcase value="one-off">
										<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
											<input type="hidden" name="cmd" value="_s-xclick">
											<input type="hidden" name="hosted_button_id" value="Z6XET59S97XLG">
											<table>
											<tr><td><input type="hidden" name="on0" value="Number of Children">Number of Children</td></tr><tr><td><select name="os0">
												<option value="1 Child">1 Child &pound;10.00 GBP</option>
												<option value="2 Children">2 Children &pound;14.00 GBP</option>
												<option value="3 Children">3 Children &pound;18.00 GBP</option>
												<option value="4 Children">4 Children &pound;22.00 GBP</option>
											</select> </td></tr>
											</table>
											<input type="hidden" name="currency_code" value="GBP">
											<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal Ð The safer, easier way to pay online.">
											<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
										</form>
									</cfcase>
									
									<cfcase value="fortnightly">
										<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
											<input type="hidden" name="cmd" value="_s-xclick">
											<input type="hidden" name="hosted_button_id" value="V35MH3KBAF92L">
											<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal Ð The safer, easier way to pay online.">
											<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
										</form>
									</cfcase>
									
									<cfcase value="monthly">
										<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
											<input type="hidden" name="cmd" value="_s-xclick">
											<input type="hidden" name="hosted_button_id" value="F24N85VWWS94W">
											<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_subscribeCC_LG.gif" border="0" name="submit" alt="PayPal Ð The safer, easier way to pay online.">
											<img alt="" border="0" src="https://www.paypalobjects.com/en_GB/i/scr/pixel.gif" width="1" height="1">
										</form>
									</cfcase>
								</cfswitch>
							
							</cfif>
		
						</div>
					</div>
				</div>
			</div>
			
		</section>
		
	</div>

</cfoutput>