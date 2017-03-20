class CueChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'cues'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def activate(data)
    Cue.find(data['id']).activate!
  end
end
