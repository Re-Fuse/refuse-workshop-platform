# == Schema Information
#
# Table name: cues
#
#  id                  :integer          not null, primary key
#  active              :boolean
#  name                :string
#  position            :string
#  partial_name        :string
#  duration            :string
#  integer             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  gesture             :integer          default("0")
#  subtitle            :string
#  text                :text
#  youtube_indentifier :string
#  youtube_start       :string
#  youtube_end         :string
#  speak_options       :string
#  room_id             :integer
#

class Cue < ApplicationRecord
  belongs_to :room

  enum gesture: [:view, :speak, :watch, :bot]

  validates_presence_of :partial_name, if: -> { view? }
  validates_presence_of [:text, :speak_options], if: -> { speak? }
  validates_presence_of [:youtube_id, :youtube_start, :youtube_end], if: -> { watch? }

  # Acivate this cue
  def activate!
    Cue.update_all active: false
    update! active: true
    ActivateCueBroadcastJob.perform_now self
  end

  # Give back html for cue
  def render
    case gesture
    when 'speak'
      path = "cues/stage/speak"
    when 'bot'
      path = "cues/stage/bot"
    when 'watch'
      path = "cues/stage/video"
    when 'view'
      path = "cues/stage/#{partial_name}"
    else
      fail "Gesture for cue #{id} not set"
    end

    ApplicationController.render(partial: path, locals: { cue: self })
  end
end
