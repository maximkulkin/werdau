$(document).ready(function() {
  $('.listing-controls select[name=view-mode]').on('change', function(e) {
    if($(this).val() == 'grid') {
      $('#products').removeClass('product-list').addClass('product-grid')
    } else {
      $('#products').removeClass('product-grid').addClass('product-list')
    }
  })
})
