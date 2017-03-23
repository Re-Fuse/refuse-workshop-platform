App.cue = App.cable.subscriptions.create "CueChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if (data['room_id'] == 1) || (data['room_id'] == user_room_id)
      $('#stage').html data['message']
      $(".st_active").hide()
      $("#active_#{data['id']}").show()
    # TODO: Activate room tab

  activate: (id)->
    @perform 'activate', id: id

$(document).on 'click', '.activate', (event)->
  App.cue.activate $(this).data('id')
  event.preventDefault()
