class Cue < ApplicationRecord
  def activate!
    Cue.update_all active: false
    update! active: true
    ActivateCueBroadcastJob.perform_now self
  end
end
