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

  acts_as_list

  enum gesture: [:view, :speak, :watch, :bot, :speech_to_text]

  validates_presence_of [:position, :room]
  validates_presence_of :partial_name, if: -> { view? }
  validates_presence_of [:text, :speak_options], if: -> { speak? }
  validates_presence_of [:youtube_indentifier, :youtube_start, :youtube_end], if: -> { watch? }

  # Acivate this cue
  def activate!
    unless gesture == 'bot'
      Cue.update_all active: false
      update! active: true
    end
    ActivateCueBroadcastJob.perform_now self
  end

  # Give back html for cue or false if you do not want to cue something
  def render
    case gesture
    when 'speak'
      path = "cues/stage/speak"
    when 'bot'
      false
    when 'watch'
      path = "cues/stage/video"
    when 'view'
      path = "cues/stage/#{partial_name}"
    when 'speech_to_text'
      path = "cues/stage/speech_to_text"
    else
      fail "Gesture for cue #{id} not set in render"
    end


    if path
      ApplicationController.render(partial: path, locals: { cue: self })
    else
      false
    end
  end

  def perform_action
    case gesture
    when 'speak'
      false
    when 'bot'
      Message.create!(
        value: self.text,
        user: bot,
        room: living_room
      )
    when 'watch'
      false
    when 'view'
      false
    else
      fail "Gesture for cue #{id} not set in perform_action"
    end
  end

  private

  def bot
    @bot ||= User.find_by(email: 'bot@bot.com')
  end

  def living_room
    @living_room ||= Room.find_by(name: 'living-room')
  end
end
