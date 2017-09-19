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

class Highlight < ApplicationRecord
  belongs_to :user

  after_create_commit { HighlightBroadcastJob.perform_now self }

end
