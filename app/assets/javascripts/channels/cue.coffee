App.cue = App.cable.subscriptions.create "CueChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#stage').html data['message']
    $(".st_active").hide()
    $("#active_#{data['id']}").show()

  activate: (id)->
    @perform 'activate', id: id

$(document).on 'click', '.activate', (event)->
  App.cue.activate $(this).data('id')
  event.preventDefault()
