class HighlightBroadcastJob < ApplicationJob
  queue_as :default

  def perform(highlight)
    ActionCable.server.broadcast(
      'highlights',
      message: render_message(highlight),
      user_id: highlight.user_id
    )
  end

  private

  def render_message(highlight)
    ApplicationController.render(
      partial: 'highlights/highlight',
      locals: { highlight: highlight }
    )
  end
end
