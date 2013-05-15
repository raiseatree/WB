
<cfoutput>

	<div class="row">
		
		<h2>Example Weekend Box</h2>
		<h3>Everything you need for an action-packed weekend - just add excitement!</h3>

		<aside class="span3">
			<ul class="nav nav-list">
				<li class="nav-header">Example Weekend Box</li>
				<!---<li><a href="##box">The Box</a></li>--->
				<li><a href="##craft">Something to Make</a></li>
				<li><a href="##cook">Something to Cook</a></li>
				<li><a href="##readwrite">Something to Read or Write</a></li>
				<li><a href="##green">Something Green</a></li>
			</ul>
		</aside>
		
		<section class="span9">

			<!---<h4 id="box">The Box <small>.</small></h4>
			#imageTag('approach.jpg')#
			<p class="lead">Our aim is to create high-quality activities for you &amp; your children to enjoy together.</p>
			<p>As a parent there are always many demands on your time and it can sometimes be hard to find time to source really exciting, high-quality activities to do with your little ones.</p>
			<p><a href="##andy">Andy</a> started Weekend Box with the aim of solving that problem by helping you along your <strong>incredible journey</strong> and the experience of bringing up your children by providing you with <strong>the things you need when you need them</strong>.</p>
			<p>Our focus is to source the highest-quality products from the best, independent suppliers across the UK. We assess each of our suppliers to ensure that their values match ours own high standards.</p>
			<p>We're also constantly trying to improve our work so if you have any comments or suggestions, we'd #mailto(emailAddress="hello@weekendboxclub.com", name="love to hear from you", encode="true")#.</p>
			<div class="alert alert-info">Think you've got what it takes to work with us? We'd love to hear from you: <strong>#mailTo('partners@weekendboxclub.com')#</strong></div>
	
			<hr>--->

			<h4 id="craft">Something to Make <small>Sock Puppet Pup!</small></h4>
			#imageTag('example-craft.jpg')#
			<p class="lead">Remember everything you need to make Sock Puppet Pup is included in your Weekend Box</p>
			<hr>
			
			<h4 id="cook">Something to Cook <small>Carrot Soup!</small></h4>
			#imageTag('example-cook.jpg')#
			<p class="lead">Our recipes are designed to be quick and easy to cook using ingredients you'll probably have already. We'll send you a special ingredient every fortnight too!</p>
			<hr>
			
			<h4 id="readwrite">Something to Read or Write <small>Build A Story!</small></h4>
			#imageTag('example-write.jpg')#
			<p class="lead">Our collaborative story writing activities are specifically designed to develop creativity in children. Send in your story and we'll send it on to someone else to write the next part!</p>
			<hr>
			
			<h4 id="green">Something Green <small>Super Strong Salad!</small></h4>
			#imageTag('example-green.jpg')#
			<p class="lead">The seeds and compost are both included in your Weekend Box as well as instructions on how to make a plant pot from an old milk bottle.</p>
			
			#includePartial('cta')#
				
		</section>
	</div>

</cfoutput>