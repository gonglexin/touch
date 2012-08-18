jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $('.carousel').carousel()
  $('.texteditor').wysihtml5({
    "lists": false,
    "image": false
  })
