
<cfoutput>

	<div class="row">
		
		<h2>Frequently Asked Questions</h2>
		
		<div class="span4">

			<div class="alert alert-info">
				<p>Prefer to talk to someone? We'd love to hear from you!</p>
				<p><strong>Telephone:</strong><br />0191 328 0640</p>
				<p><strong>Email:</strong><br />#mailto('hello@weekendboxclub.com')#</p>
			</div>
			
			<h4>All Sorted?</h4>
			<p>#linkTo(controller="main", action="order", text="Order Now &raquo;", role="button", class="big-btn")#</p>
			
		</div>
		
		<div class="span8">
			
			#includePartial('faqs')#
			
			<div class="alert alert-info">
				<p>Didn't find what you were looking for? We'd love to answer your question!</p>
				<p><strong>Telephone:</strong><br />0191 328 0640</p>
				<p><strong>Email:</strong><br />#mailto('hello@weekendboxclub.com')#</p>
			</div>
			
		</div>
		
	</div>

</cfoutput>