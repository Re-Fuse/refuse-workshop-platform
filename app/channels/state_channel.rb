class StateChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'states'
  end

  def speak(data)
    ActionCable.server.broadcast('messages',
      message: render_message(data['message']))
  end

  private

  def render_message(message)
    ApplicationController.render(
      partial: 'states/message',
      locals: { message: message }
    )
  end
end
