(function($){
  $(document).ready(function() {
    $('.order-items a.delete').live('click', function(e) {
      $(this).parents('tr').first().find('input.quantity').val(0);
      $(this).parents('form').first().submit();
      e.preventDefault();
    });

    $('header .cart .icon').fancybox({type: 'ajax'})

    $('.buy input[type=submit]').click(function(e) {
      var form = $(this).parent('form')
      $.post(form.attr('action'), form.serialize(), function() {
        $.fancybox({type: 'ajax', href: '/cart'})
      })
      e.preventDefault();
    })
  });
})(jQuery);
