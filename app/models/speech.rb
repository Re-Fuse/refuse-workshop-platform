# == Schema Information
#
# Table name: speeches
#
#  id         :integer          not null, primary key
#  text       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Speech < ApplicationRecord
  belongs_to :user
end
