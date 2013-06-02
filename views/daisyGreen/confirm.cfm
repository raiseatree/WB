<cfparam name="data">
<cfoutput>

	<div class="row">
		
		<h2>Thanks - your competition entry has been confirmed!</h2>
		
		<hr>
		
		<div class="row">
			<div class="span6">
            	<h2>SPECIAL OFFER!</h2>
				<h3>Thank you for entering our competition - order a Weekend Box now for just &pound;5!</h3>
            	#linkTo(controller="daisyGreen", action="purchase", text="Buy Weekend Box for &pound;5 &raquo;", params="code=#params.code#", class="btn btn-success btn-large btn-block", style="color: ##FFF;")#  
				<h5 class="center-align">Includes FREE Delivery (Saving up to 50%!)</h5>
			</div>
			<div class="span6">#imageTag('splash-img.png')#</div>
		</div>
		
	</div>

</cfoutput>