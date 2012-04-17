
$(document).ready(function() {
  $('.mainmenu > li > a').on('click', function(event) {
    var item = $(this).parents('li')
    var selected = item.hasClass('selected')

    $('.mainmenu > li').removeClass('selected')
    if (!selected) {
      item.addClass('selected')
    }

    event.preventDefault()
  })
})

