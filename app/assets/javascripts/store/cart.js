(function($){
  $(document).ready(function() {
    $(document).ajaxStart(function() { $.fancybox.showActivity() })
    $(document).ajaxStop(function() { $.fancybox.hideActivity() })

    function updateCart() {
      $('.content.cart form.order-items').ajaxSubmit({dataType: 'script'})
    }

    // The "buy" button
    $('.buy input[type="submit"]').live('click', function(event) {
      event.preventDefault();

      $(this).closest('form').ajaxSubmit({dataType: 'script'})
    })

    $('.content.cart .order-items a.delete').live('click', function(event) {
      event.preventDefault();

      $(this).closest('tr').find('input.quantity').val(0)

      updateCart()
    });

    $('.content.cart .update input[type="submit"]').live('click', function(event) {
      event.preventDefault()
      updateCart()
    })

    $('.content.cart form.checkout input[type="submit"]').live('click', function(event) {
      event.preventDefault()
      $(this).closest('form').ajaxSubmit({dataType: 'script'})
    })

    $('header .cart .icon, header a.open_cart, .bpanel .tab.cart').live('click', function(event) {
      event.preventDefault()

      $.ajax('/cart.js')
    })

  });
})(jQuery);

