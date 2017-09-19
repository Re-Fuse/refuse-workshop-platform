# == Schema Information
#
# Table name: highlights
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :highlight do
    user nil
    message "MyText"
  end
end
