class ActivateCueBroadcastJob < ApplicationJob
  queue_as :default

  def perform(cue)
    html = cue.render
    if html
      ActionCable.server.broadcast 'cues', message: html, id: cue.id, room_id: cue.room_id
    else
      cue.perform_action
    end
  end
end
