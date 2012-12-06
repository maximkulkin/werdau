jQuery ->
  $("span.callback a, a.callback").on "click", (event) ->
    event.preventDefault()
    $.ajax("/support/callback.js")

  $("form.callback input[type=submit]").live "click", (event) ->
    event.preventDefault()
    $(@).closest("form").ajaxSubmit({dataType: "script"})

