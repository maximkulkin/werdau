Spree.Admin.ajaxSearchField = function(searchField, searchUrl, searchHits, nameField, idField, priceField, params) {
	var defaults = {
		onSelect: function(){}
	};
	params = jQuery.extend( false, defaults, params ); // Override defaults with user's provided params

	function doSearch(){
		$.ajax({
			data: {q: searchField.val() },
			dataType: 'html',
			success: function(request){
				searchHits.html(request);
				setupSelector();
			},
			url: searchUrl
		});
	}

	function setupSelector(){
		Spree.Admin.ajaxSearchResultsSelector(
			searchHits,
			[[nameField, "data-name"],
			 [idField, "data-id"],
			 [priceField, "data-price"]],
			{
				onSelect: params.onSelect});
	}

	Spree.Admin.doOnType(searchField, doSearch);
};