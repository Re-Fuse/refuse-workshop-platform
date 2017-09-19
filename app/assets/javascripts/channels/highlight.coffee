App.highlight = App.cable.subscriptions.create "HighlightChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#user_#{data['user_id']}").append data['message']

  speak: (message)->
    @perform 'speak', message: message
