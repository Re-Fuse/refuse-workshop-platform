class ActivateCueBroadcastJob < ApplicationJob
  queue_as :default

  def perform(cue)
    ActionCable.server.broadcast 'cues', message: render_cue(cue), id: cue.id
  end

  private

  def render_cue(cue)
    ApplicationController.render(
      partial: "cues/stage/#{cue.action}",
      locals: { cue: cue }
    )
  end
end
