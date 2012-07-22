$(document).ready(function() {
  $('body').on('click', function(e) {
    if($(e.target).closest('#product-categories ul.level1 > li').length == 0) {
      $('#product-categories ul.level1 > li').removeClass('selected')
    }
  })
})
