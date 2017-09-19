class HighlightChannel < ApplicationCable::Channel
  def subscribed
    stream_from "highlights"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Highlight.create! message: data['message'], user: current_user
  end
end
