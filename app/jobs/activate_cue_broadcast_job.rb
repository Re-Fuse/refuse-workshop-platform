class ActivateCueBroadcastJob < ApplicationJob
  queue_as :default

  def perform(cue)
    ActionCable.server.broadcast channel, message: cue.render, id: cue.id, room_id: cue.room_id
  end
end
