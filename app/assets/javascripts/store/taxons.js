
$(document).ready(function() {
  $('#product-categories .level1 > li > a').on('click', function(event) {
    var item = $(this).parents('li')
    var selected = item.hasClass('selected')

    $('#product-categories .level1 > li').removeClass('selected')

    if (!selected) {
      item.addClass('selected')
    }

    event.preventDefault()
  })
})

