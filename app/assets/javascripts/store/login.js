(function($){
  $(document).ready(function() {
    $('#fancybox-wrap div[data-hook="login"] :submit').live('click', function(e) {
      e.preventDefault()
      $(this).closest('form').ajaxSubmit({dataType: 'script'})
    })

    $('#fancybox-wrap a[href="/login"], #fancybox-wrap a[href="/signup"], #fancybox-wrap a[href="/user/password/new"]').live('click', function(e) {
      e.preventDefault()
      $.ajax({url: $(this).attr('href'), dataType: 'script'})
    })
    
    $('#fancybox-wrap #forgot-password form').live('submit', function(e) {
      e.preventDefault()
      $(this).ajaxSubmit({dataType: 'script'})
    })

    $('#fancybox-wrap #new-customer form').live('submit', function(e) {
      e.preventDefault()
      $(this).ajaxSubmit({dataType: 'script'})
    })
  })
})(jQuery);
