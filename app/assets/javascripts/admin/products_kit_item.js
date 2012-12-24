Spree.Admin.ProductsKitItem = function(elem){
	// Attaching product
	Spree.Admin.ajaxSearchField(
		elem.find("#products_kit_item_variant_name"),
		elem.find("form").attr("data-search-products-url"),
		elem.find(".products-search-results"),
		elem.find("#products_kit_item_variant_name"),
		elem.find("#products_kit_item_variant_id"),
		elem.find("#products_kit_item_variant_price"),
		{
			onSelect: save });


	elem.find(":checkbox").click(save);
	Spree.Admin.doOnTyping(elem.find("#products_kit_item_discount"), save);

	// Delete self
	elem.find("> a.delete.saved").bind("ajax:success", function(){
		elem.remove();
	});
	elem.find("> a.delete.new-record").click(function(){
		elem.remove();
		return false;
	});


	function save(){
		elem.find("form").submit();
		// Temporary solution, because [1] does't works
		elem.find("form").attr("method", "PUT");
	}

	// [1]
	// Be sure to rerender form. If it was a first submit of not saved product_item, then
	// "POST" form method was used and to update product, we must use "PUT" method instead.
	// This way, form for not saved item should be replaced with form for saved item (to update it).
	elem.find("form").bind("ajax:success", function(response){
		elem.replaceWith(response);
	});
};