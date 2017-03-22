class ActivateCueBroadcastJob < ApplicationJob
  queue_as :default

  def perform(cue)
    ActionCable.server.broadcast 'cues', message: cue.render, id: cue.id
  end
end
