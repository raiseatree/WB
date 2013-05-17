<cfoutput>

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