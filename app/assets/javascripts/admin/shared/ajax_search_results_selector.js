Spree.Admin.ajaxSearchResultsSelector = function(searchHitsContainer, textFieldForSelectedResultName, hiddenFieldForSelectedResultId) {
    searchHitsContainer.find(".actions a").live("click", function(){
      var tr = $(this).closest("tr");
      textFieldForSelectedResultName.val(tr.attr("data-name"));
      hiddenFieldForSelectedResultId.val(tr.attr("data-id"));
      searchHitsContainer.children().remove();
    });
}