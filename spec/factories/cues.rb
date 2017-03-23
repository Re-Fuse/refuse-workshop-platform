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
#  speak_options :string
#  room_id       :integer
#

FactoryGirl.define do
  factory :cue do
    active false
    name "MyString"
    position "MyString"
    action "MyString"
    duration "MyString"
    integer "MyString"
  end
end
