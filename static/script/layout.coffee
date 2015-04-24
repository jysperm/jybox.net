$ ->
  $('nav a').each ->
    if $(@).attr('href') == location.pathname
      $(@).parent().addClass('active')
