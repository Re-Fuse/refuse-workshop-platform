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
    User.where(email: ['efthimis80@hotmail.com', 'jose25garcia@hotmail.com', 'katamiaennoia@gmail.com']).update_all room_id: find_by(name: 'kitchen-a').id
    User.where(email: ['chioti22@gmail.com', 'baswiegers@gmail.com', 'george.dumitriu.jz@gmail.com', 'roepot@gmail.com']).update_all room_id: find_by(name: 'kitchen-b').id
    User.where(email: ['tzeniamorphy@gmail.com', 'richardehaynes@me.com', 'kieranklaassen@gmail.com', 'elsamondelaers@gmail.com']).update_all room_id: find_by(name: 'kitchen-c').id
  end

  def self.set_group_b
    User.where(email: ['richardehaynes@me.com', 'roepot@gmail.com', 'chioti22@gmail.com', 'elsamondelaers@gmail.com']).update_all room_id: find_by(name: 'kitchen-a').id
    User.where(email: ['efthimis80@hotmail.com', 'jose25garcia@hotmail.com', 'tzeniamorphy@gmail.com', 'kieranklaassen@gmail.com']).update_all room_id: find_by(name: 'kitchen-b').id
    User.where(email: ['baswiegers@gmail.com', 'george.dumitriu.jz@gmail.com', 'katamiaennoia@gmail.com']).update_all room_id: find_by(name: 'kitchen-c').id
  end
end
