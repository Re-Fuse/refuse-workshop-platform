App.cue = App.cable.subscriptions.create "CueChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # If everyone or your set cue
    if (data['room_id'] == 1) || (data['room_id'] == user_room_id)
      $('#stage').html data['message']

      # Activate the right room
      $("#room_id_#{data['room_id']}").tab('show')

    $(".st_active").hide()
    $("#active_#{data['id']}").show()

  activate: (id)->
    @perform 'activate', id: id

$(document).on 'click', '.activate', (event)->
  App.cue.activate $(this).data('id')
  event.preventDefault()
