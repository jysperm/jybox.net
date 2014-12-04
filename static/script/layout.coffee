$ ->
  $('nav a').each ->
    if $(@).attr('href') == location.pathname
      $(@).parent().addClass('active')

  window.duoshuoQuery =
    short_name: 'jybox'
