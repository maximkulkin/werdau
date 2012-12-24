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
		var fields = [];
		if ( nameField != null )
			fields.push([nameField, "data-name"]);
		if ( idField != null )
			fields.push([idField, "data-id"]);
		if ( priceField != null )
			fields.push([priceField, "data-price"]);

		Spree.Admin.ajaxSearchResultsSelector(
			searchHits,
			fields,
			{
				onSelect: params.onSelect});
	}

	Spree.Admin.doOnTyping(searchField, doSearch);
};