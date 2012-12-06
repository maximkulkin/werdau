Spree.Admin.ajaxSearchField = function(searchField, searchUrl, searchHits) {
	function search_for_taxons(){
		$.ajax({
			data: {q: searchField.val() },
			dataType: 'html',
			success: function(request){
			 searchHits.html(request);
			},
			url: searchUrl
		});
	}

	searchField.keypress(function (e) {
		if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
			search_for_taxons();
			return false;
		} else
			 return true;
	});

	searchField.delayedObserver(function() {
		search_for_taxons();
	}, 0.75);
};