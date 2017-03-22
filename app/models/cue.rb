# == Schema Information
#
# Table name: cues
#
#  id            :integer          not null, primary key
#  active        :boolean
#  name          :string
#  position      :string
#  partial_name  :string
#  duration      :string
#  integer       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  gesture       :integer          default("0")
#  subtitle      :string
#  text          :string
#  youtube_id    :string
#  youtube_start :string
#  youtube_end   :string
#

class Cue < ApplicationRecord
  enum gesture: [:view, :speak, :watch]

  # Acivate this cue
  def activate!
    Cue.update_all active: false
    update! active: true
    ActivateCueBroadcastJob.perform_now self
  end

  # Give back html for cue
  def render
    case gesture
    when :speak
      path = "cues/stage/speak"
    when :watch
      path = "cues/stage/video"
    when :view
      path = "cues/stage/#{partial_name}"
    else
      fail "Gesture for cue #{id} not set"
    end

    ApplicationController.render(partial: path, locals: { cue: self })
  end
end
