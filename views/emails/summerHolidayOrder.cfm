<cfoutput>

<h3>Box Type</h3>
<p>#params.planName#</p>

<h3>Customer Details</h3>
<p>
	#child.name#<br />
	#customer.address#<br />
	#customer.address2#<br />
	#customer.city#<br />
	#customer.county#<br />
	#customer.postCode#<br />
</p>

<h3>Order Extras</h3>
<cfif IsDefined("params.apron.item") AND params.apron.item EQ 'yes'>
	<h4>Apron(s)</h4>
	<p>
		Quantity: #params.apron.quantity#<br />
		Size: #params.apron.size#<br />
		Customisation: #params.apron.instructions#
	</p>
</cfif>
<cfif IsDefined("params.tshirt.item") AND params.tshirt.item EQ 'yes'>
	<h4>T-Shirt(s)</h4>
	<p>
		Quantity: #params.tshirt.quantity#<br />
		Size: #params.tshirt.size#
	</p>
</cfif>

<h3>Total Amount</h3>
<p>&pound;#DecimalFormat(params.basketTotal)#</p>

</cfoutput>