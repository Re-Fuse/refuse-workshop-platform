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

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create_commit { MessageBroadcastJob.perform_now self }

  def self.highlights
    where("value LIKE '%Highlighted this%'").order(:id).includes(:user)
  end

  def self.highlight_stats
    tokeniser = WordsCounted.count(self.highlights.pluck(:value).join(),exclude: "span Highlighted this").token_frequency

  end
end
