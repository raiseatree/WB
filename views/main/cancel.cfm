<cfoutput>
	
	<div class="row">
		
		<h2>Oh No! Cancelled Payment</h2>
		<h3>We're sorry - you seem to have cancelled your payment - is there a problem?</h3>
		
		<p class="text-center">Hopefully we can help - if you have a question or a problem, please don't hesitate to drop us a line at #mailTo('hello@weekendboxclub.com')# and we'll do our best to answer your query.</p>
		
		<div class="offset5">#linkTo(href="mailto:hello@weekendboxclub.com", text="Email Us &raquo;", role="button", class="big-btn")#</div>
		
	</div>

</cfoutput>