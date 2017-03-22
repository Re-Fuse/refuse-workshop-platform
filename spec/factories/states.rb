# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  step       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :state do
    step 1
  end
end
