// Params:
//   valuesMapping:
//     Determines, what values will be copied to what field, when element from search result will be selected.
//     Has a format of array:
//       [[jqueryInputField, "data-id"],
//        [anotherJqueryInputField, "data-name"]]
//     So, when table element is selected, "data-id" attribute of selected table row will be copied to "jqueryInputField",
//     and "data-name" attribute of selected table row will be copied to "anotherJqueryInputField"

Spree.Admin.ajaxSearchResultsSelector = function(searchHitsContainer, valuesMapping, params) {
	var defaults = {
		onSelect: function(){}
	};
	params = jQuery.extend( false, defaults, params ); // Override defaults with user's provided params

    searchHitsContainer.find(".actions a").click(function(){
      var tr = $(this).closest("tr");
      for ( var i = 0; i < valuesMapping.length; i++ )
      {
        var dest = valuesMapping[i][0];
        var val = tr.attr(valuesMapping[i][1]);
        dest.val(val);
      }
      // textFieldForSelectedResultName.val(tr.attr("data-name"));
      // hiddenFieldForSelectedResultId.val(tr.attr("data-id"));
      searchHitsContainer.children().remove();

      params.onSelect();
    });
}