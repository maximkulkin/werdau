$(document).ready(function() {
  $('.bpanel .tab.viewed_recently').on('click', function(event) {
    event.preventDefault()
    $('#recently_viewed_products').toggle()
  })
  $('body').on('click', function(event) {
    if($(event.target).closest('.bpanel').length == 0) {
      $('#recently_viewed_products').hide()
    }
  })
})
