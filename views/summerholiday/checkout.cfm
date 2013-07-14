<cfparam name="publicKey">
<cfparam name="data">
<cfoutput>

	<div class="row">
		
		<h2>Weekend Box Payment</h2>
		<hr>
		
		<aside class="span4">
			
			<div class="sidebar-nav-fixed alert alert-success">
				<h4>Order Total:</h4>
				<h3>&pound;<span class="basket-amount">36.00</span> (FREE Delivery!)</h3><hr>
				
				<h4>Delivery Address</h4>
				<p><strong>#data.customer.name#</strong><br />#data.customer.address#<br /><cfif data.customer.address2 GT ''>#data.customer.address2#<br /></cfif>#data.customer.city#<br />#data.customer.postcode#</p>
			
				<h4>First Box Arrival Date (Estimate)</h4>
				<p><i class="icon-calendar"></i> Monday 22nd July 2013</p>
	
			</div>
		
		</aside>
		
		<section class="span8">
			
			#startFormTag(controller="summerholiday", action="process", method="POST", class="checkout")#
			
				<fieldset>
					<legend>Summer Holiday Box Type</legend>

					<div class="alert alert-info">Summer Holiday boxes are sent every week during the summer holidays - there's <strong>no subscription</strong> at all and you'll only be charged once.</div>
				
					<div class="form-block">
						
						<div class="control-group">
							<label class="radio">
								#radioButtonTag(name="planName", value="smallBox", class="summerBox small", checked="yes")#
								<strong>Small Box</strong> - 6x Boxes, 2 Activities per box - &pound;36 (&pound;6 per box)
							</label>
							<label class="radio">
								#radioButtonTag(name="planName", value="boxBox", class="summerBox big", checked="no")#
								<strong>Big Box</strong> - 6x Boxes, 4 Activities per box - &pound;48 (&pound;8 per box)
							</label>
						</div>
						
					</div>
				
				</fieldset>
				
				<fieldset class="clearfix">
					<legend>Weekend Box Apron</legend>
				
					<p>Weekend Box Aprons are perfect for painting, gluing, cooking and much more! Aprons can even be customised <strong>FREE OF CHARGE</strong> with the name of your little one on! Various sizes available.</p>
					
					#imageTag(source="wb-apron.png", class="span2 pull-right")#
					
					<div class="form-block span5 pull-left">
						
						<div class="control-group">
							<label class="radio">
								<input type="radio" name="apron[item]" class="add-apron" value="yes">
								<strong>Children's Weekend Box Apron</strong> (+ &pound;9.99 with <strong>FREE customisation</strong>)
							</label>
						</div>
						
						<div class="choose-apron-size" style="display: none;">
							<p>Please select a size below:</p>
							<select name="apron[size]" class="apron-choose-size">
								<option selected="true"></option>
								<option value="Toddler">Toddler - 51cm x 35cm (Height x Width)</option>
								<option value="Child">Child - 75cm x 54cm (Height x Width)</option>
							</select>
							
							<p>
								<textarea name="apron[instructions]" class="add-apron-name" placeholder="Enter Customisation Name(s)" maxlength="10"></textarea>
								<span class="help-inline">Maximum 10 Characters per Name</span>
							</p>
							
						</div>
						
					</div>
				
				</fieldset>
				
				<fieldset class="clearfix">
					<legend>Weekend Box T-Shirt</legend>
				
					<p>Our short-sleeve 100% Cotton Weekend Box T-Shirts are perfect for keeping your little ones cool this summer! Like our Weekend Boxes, the t-shirts are made in the UK. Various sizes available.</p>
					
					#imageTag(source="tshirt.png", class="span2 pull-right")#
					
					<div class="form-block span5 pull-left">
						
						<div class="control-group">
							<label class="radio">
								<input type="radio" name="tshirt[item]" class="add-tshirt" value="yes">
								<strong>Children's Weekend Box T-Shirt</strong> (+ &pound;9.99)
							</label>
							<div class="choose-tshirt-size" style="display: none;">
								<p>Please select a size below:</p>
								<select name="tshirt[size]" class="tshirt-choose-size">
									<option selected="true"></option>
									<option value="3-4">3-4 Years Old</option>
									<option value="4-5">4-5 Years Old</option>
									<option value="5-6">5-6 Years Old</option>
									<option value="6-7">6-7 Years Old</option>
									<option value="7-8">7-8 Years Old</option>
								</select>
							</div>
						</div>
						
					</div>
					
				</fieldset>
				
				<div class="alert">
					<strong>Please note</strong> - Aprons &amp; T-Shirts are dispatched separately from your first Weekend Box
				</div>
				
				<fieldset class="clearfix">
					<legend>Your Basket</legend>
					
					<div class="form-block">
						<h4>Order Notes</h4>
						<textarea name="notes" placeholder="Enter Order Notes Here" cols="50"></textarea>
					</div>
					
					<table class="table table-striped">
						<thead>
							<tr>
								<th>##</th>
								<th>Item</th>
								<th>Quantity</th>
								<th>Amount (&pound;)</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody class="basket-items">
							<tr>
								<td>1</td>
								<td>Weekend Box Little Box</td>
								<td>1</td>
								<td>36.00</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					
					<!--- Hidden form elements --->
					#hiddenFieldTag(name="apron[quantity]", value="0", class="apron-quantity")#
					<cfif IsDefined("data.offer") AND data.offer EQ true>
						#hiddenFieldTag(name="tshirt[item]", value="yes")#
					</cfif>
					#hiddenFieldTag(name="tshirt[quantity]", value="0", class="tshirt-quantity")#
					#hiddenFieldTag(name="basketTotal", value="36.99", class="form-basket-total")#
					
					<div class="offset2"><button id="customButton" class="btn big-btn">Pay with Credit/Debit Card</button></div>
					
					<p>#imageTag(source='padlock.png', class="padlock")# Your card details are NOT stored by us stored completely securely by our bank.</p>
					
				</fieldset>
			
			#endFormTag()#
			
		</section>
		
	</div>
	
	#javascriptIncludeTag('jquery.livequery.js')#
	<script src="https://checkout.stripe.com/v2/checkout.js"></script>
	
	<script>
		$(document).ready(function() {
			
			// Define the start number of items in the basket
			var basketItems = 1;
			
			// Define the type of box the customer gets
			var boxType = 'small';
			
			// Add in the free tshirt for promo orders
			<cfif IsDefined("data.offer") AND data.offer EQ true>
				var item = 'FREE Weekend Box T-Shirt (Specify size required in notes field above)';
				updateBasket(item, 0.00);
				
				// Update the form quantity hidden field
				var qty = parseInt($('.tshirt-quantity').val() + 1);
				$('.tshirt-quantity').val( qty );
			</cfif>			
			
			/*
			 * Select a box size
			 */
			$('.summerBox').click(function() {
				
				// Get the current amount in the basket 
				var currentAmount = parseFloat($('.basket-amount').text());
				
				// Check which radio button has been clicked on 
				if ($(this).hasClass('small')) {
				
					// Check if we already have a small box in the basket
					if (boxType != 'small') {

						// Change the basket item
						$('.basket-items tr:nth-child(1) td:nth-child(2)').text('Weekend Box Little Box');
						$('.basket-items tr:nth-child(1) td:nth-child(4)').text('36.00');
						
						// Reduce the price 
						currentAmount = currentAmount - 12;
						$('.basket-amount').text(currentAmount.toFixed(2));
						$('.form-basket-total').val( currentAmount.toFixed(2) );
						
						// Update the global box type
						boxType = 'small';
					}
				
				}
				else {
					
					// Check if we already have a big box in the basket
					if (boxType != 'big') {
								
						// Change the basket item
						$('.basket-items tr:nth-child(1) td:nth-child(2)').text('Weekend Box Big Box');
						$('.basket-items tr:nth-child(1) td:nth-child(4)').text('48.00');
						
						// Increase the price 
						currentAmount = currentAmount + 12;
						$('.basket-amount').text(currentAmount.toFixed(2));
						$('.form-basket-total').val( currentAmount.toFixed(2) );
								
						// Update the global box type
						boxType = 'big';
								
					}
					
					
					
				}
				
			});
			
			/*
			 * Select an apron size
			 */
			$('.add-apron').click(function() {
				$('.choose-apron-size').show();
			});
			
			/*
			 * Add Apron to the basket
			 */
			$('.apron-choose-size').change(function() {
				var item = 'Weekend Box Apron (Size: ' + $('.choose-apron-size option:selected').text() + ')';
				updateBasket(item, 9.99);
				
				// Update the form quantity hidden field
				var qty = parseInt($('.apron-quantity').val() + 1);
				$('.apron-quantity').val( qty );
				
			});
			
			/*
			 * Add Apron Name
			 */
			$('.add-apron-name').focusout(function() {
				var item = 'Apron Custom Name: (' + $(this).val() + ')';
				updateBasket(item, 0);
			});
			
			
			/*
			 * Select a t-shirt size
			 */
			$('.add-tshirt').click(function() {
				$('.choose-tshirt-size').show();
			});
			
			/*
			 * Add T-Shirt to the basket
			 */
			$('.tshirt-choose-size').change(function() {
				var item = 'Weekend Box T-Shirt (Size: ' + $('.choose-tshirt-size option:selected').text() + ')';
				updateBasket(item, 9.99);
				
				// Update the form quantity hidden field
				var qty = parseInt($('.tshirt-quantity').val() + 1);
				$('.tshirt-quantity').val( qty );
				
			});
			
			/*
			 * Update Basket functionality 
			 */
			 function updateBasket(item, amount) {
			 	
			 	// Update the number of items in the basket
			 	basketItems = basketItems + 1;
			 	
			 	// Add the item to the list - detect if it's a freebie and ban adding more quantities
			 	if (amount == 0.00) {
			 		$('.basket-items').append('<tr><td>' + basketItems + '</td><td>' + item + '</td><td><span class="amount">1</span></td><td>' + amount.toFixed(2) + '</td><td><a href="##" class="delete-item"><i class="icon-remove"></i></a></td>');
			 	}
			 	else {
			 		$('.basket-items').append('<tr><td>' + basketItems + '</td><td>' + item + '</td><td><a href="##" class="subtract"><i class="icon-chevron-down"></i></a> <span class="amount">1</span> <a href="##" class="add"><i class="icon-chevron-up"></i></td><td>' + amount.toFixed(2) + '</td><td><a href="##" class="delete-item"><i class="icon-remove"></i></a></td>');
			 	}
			 	
			 	// Get the current basket total and add on the amount
			 	var currentAmount = parseFloat($('.basket-amount').text()) + amount;

				// Update the basket amount text
				$('.basket-amount').text(currentAmount.toFixed(2));
				
				// Update the hidden field so we make sure we bill the user the full amount
				$('.form-basket-total').val( currentAmount.toFixed(2) );
			 
			 };
			 
			 /*
			  * Increases quantity in the basket
			  */
			 $('.add').livequery('click', function() {
			 	
			 	// Increase the value in the basket 
			 	var currentAmount = parseFloat($('.basket-amount').text()) + 9.99;
			 	$('.basket-amount').text(currentAmount.toFixed(2));
			 	$('.form-basket-total').val( currentAmount.toFixed(2) );
			 	
			 	// Update the basket quantity
			 	var quantity = parseInt($(this).parent().children("span.amount").text()) + 1;
			 	$(this).parent().children("span.amount").text( parseInt(quantity) );
			 	
			 	// Update the amount for this item in the basket
			 	var itemAmount = 9.99 * quantity;
			 	$(this).parent().parent().children('td:nth-child(4)').text(itemAmount.toFixed(2))
			 	
			 	// Workout if it's a tshirt or apront then update the form hidden quantity
			 	var str = $(this).parent().parent().children('td:nth-child(2)').text();
			 	if ( str.indexOf("T-Shirt") != -1 ){
			 		// T-Shirt
			 		var qty = parseInt($('.tshirt-quantity').val()) + 1;
					$('.tshirt-quantity').val( qty );
			 	}
			 	else {
			 		// Apron
			 		var qty = parseInt($('.apron-quantity').val()) + 1;
					$('.apron-quantity').val( qty );
			 	}
			 	
			 	return false;
			 	
			 });
			 
			 /*
			  * Decreases quantity in the basket
			  */
			 $('.subtract').livequery('click', function() {
			 	
			 	// Update the basket quantity
			 	var quantity = parseInt($(this).parent().children("span.amount").text()) - 1;
			 	
			 	// Quick check to make sure minimum order is 1
			 	if (quantity < 1) {
			 		quantity = 1;	
			 	}
			 	else {
			 		// Decrease the value in the basket (only if we have at least 1 quantity)
				 	var currentAmount = parseFloat($('.basket-amount').text()) - 9.99;
				 	$('.basket-amount').text(currentAmount.toFixed(2));
				 	$('.form-basket-total').val( currentAmount.toFixed(2) );
			 	}
			 	
			 	// Update the basket
			 	$(this).parent().children("span.amount").text( parseInt(quantity) );
			 	
			 	// Update the amount for this item in the basket
			 	var itemAmount = 9.99 * quantity;
			 	$(this).parent().parent().children('td:nth-child(4)').text(itemAmount.toFixed(2))
			 	
			 	// Workout if it's a tshirt or apront then update the form hidden quantity
			 	var str = $(this).parent().parent().children('td:nth-child(2)').text();
			 	if ( str.indexOf("T-Shirt") != -1 ){
			 		// T-Shirt
					$('.tshirt-quantity').val( quantity );
			 	}
			 	else {
			 		// Apron
					$('.apron-quantity').val( quantity );
			 	}
			 	
			 	return false;
			 	
			 });
			 
			 /*
			  * Deletes an item from the basket 
			  */
			$('.delete-item').livequery("click", function() {

				// Reduce the basket total
				var currentAmount = parseFloat($('.basket-amount').text()) - $(this).parent().prev().text();

				// Update the basket amount text
				$('.basket-amount').text(currentAmount.toFixed(2));

			 	// Remove the item from the basket
			 	$(this).parent().parent().remove();
			 	
			 	// Reduce the counter of items in the basket 
			 	basketItems = basketItems - 1;
			 	
			 	// Workout if it's a tshirt or apron then update the form hidden quantity
			 	var str = $(this).parent().parent().children('td:nth-child(2)').text();
			 	if ( str.indexOf("T-Shirt") != -1 ){
			 		// T-Shirt
			 		$('.tshirt-quantity').val( 0 );
			 	}
			 	else {
			 		// Apron
			 		$('.apron-quantity').val( 0 );
			 	}
			 	
			 	return false;
			});
			 
			 /*
			  * Initialises the checkout button
			  */
			$('##customButton').click(function(){
				var token = function(res){
					var $input = $('<input type=hidden name=stripeToken />').val(res.id);
				    $('form.checkout').append($input).submit();
				};
				
			  	StripeCheckout.open({
				    key:         '#publicKey#',
				    amount:      $('.basket-amount').text().replace('.',''),
				    currency:    'gbp',
				    name:        'Weekend Box',
				    description: 'Summer Holiday Club Box + Optional Extras',
				    panelLabel:  'Checkout',
				    image:		 '/images/stripe-logo.jpg',
				    token:       token
				});
				
				return false;
  			});
		});
	
	</script>
</cfoutput>