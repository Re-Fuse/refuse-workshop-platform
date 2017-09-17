App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#chat[data-room='#{data['room_id']}'] .messages").append data['message']
    $("#chat[data-room='#{data['room_id']}'] .messages").scrollTop($("#chat[data-room='#{data['room_id']}'] .messages")[0].scrollHeight);

    # Speak bot
    if data['bot']
      responsiveVoice.speak(data['text'], "Greek Female", { pitch: 1.6 })

  speak: (message, room_id)->
    @perform 'speak', message: message, room_id: room_id


$(document).on 'keypress', '#chat-input', (event)->
  if event.keyCode is 13
    App.room.speak event.target.value, $(this).parent('#chat').data('room')
    event.target.value = ''
    event.preventDefault()
