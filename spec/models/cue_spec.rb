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

require 'rails_helper'

RSpec.describe Cue, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
