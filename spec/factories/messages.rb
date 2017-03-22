# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  value      :text
#  user_id    :integer
#  room_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :message do
    value "MyText"
    user nil
    room nil
  end
end
