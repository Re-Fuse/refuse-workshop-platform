class SpeechChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'speech'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Speech.create! text: data['message'], user: current_user
  end
end
