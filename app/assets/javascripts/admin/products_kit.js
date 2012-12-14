Spree.Admin.ProductsKit = function(elem){
	elem.find("ul.items > li").each(function(){
		new Spree.Admin.ProductsKitItem($(this));
	});

	// New item
	elem.find("a.new.products_kit_item").click(function(){
		$.ajax({
			dataType: 'html',
			url: $(this).attr("href"),
			success: function(response){
				elem.find("ul.items").append(response);
				new Spree.Admin.ProductsKitItem(elem.find("ul.items > li:last"));
			}
		});
		return false;
	});

	// Delete self
	elem.find("> a.delete.saved").bind("ajax:success", function(){
		elem.fadeOut(620, elem.remove);
		return false;
	});
	elem.find("> a.delete.new-record").click(function(){
		elem.fadeOut(620, elem.remove);
		return false;
	});
}