$(document).ready(function() {
  $('.bpanel .tab.viewed_recently').on('click', function(event) {
    event.preventDefault()
    $('#recently_viewed_products').toggle()
  })
})
