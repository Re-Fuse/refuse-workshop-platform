class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast(
      'room_channel',
      message: render_message(message),
      room_id: message.room.id,
      bot: (message.user.email == 'bot@bot.com'),
      text: message.value
    )
  end

  private

  def render_message(message)
    ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message }
    )
  end
end
