# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  purpose    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ApplicationRecord
  has_many :messages
  has_many :users
  has_many :cues

  def self.set_group_a
    User.where(id: [16, 19, 18, 23]).update_all room_id: find_by(name: 'kitchen-a').id
    User.where(id: [17, 20, 22, 25]).update_all room_id: find_by(name: 'kitchen-b').id
    User.where(id: [15, 14, 21, 24]).update_all room_id: find_by(name: 'kitchen-c').id
  end

  def self.set_group_b
    User.where(id: [17, 19, 22, 24]).update_all room_id: find_by(name: 'kitchen-a').id
    User.where(id: [16, 14, 18, 25]).update_all room_id: find_by(name: 'kitchen-b').id
    User.where(id: [15, 20, 21, 23]).update_all room_id: find_by(name: 'kitchen-c').id
  end
end
