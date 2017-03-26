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
    # A1.1 Efthimis Pepe Thanasis
    # B1.1 Iro Bas George Roelof
    # C1.3 Tzeni Richard Kieran Els
    # TODO: Check iro email chioti22@yahoo.com, Richard, richardehaynes@me.com and elsamondelaers@gmail.com Els

    User.where(email: ['efthimis80@hotmail.com', 'jose25garcia@hotmail.com', 'katamiaennoia@gmail.com']).update_all room: find_by(name: 'kitchen-a')
    User.where(email: ['chioti22@yahoo.com', 'baswiegers@gmail.com', 'george.dumitriu.jz@gmail.com', 'roepot@gmail.com']).update_all room: find_by(name: 'kitchen-b')
    User.where(email: ['tzeniamorphy@gmail.com', 'richardehaynes@me.com', 'kieranklaassen@gmail.com', 'elsamondelaers@gmail.com']).update_all room: find_by(name: 'kitchen-c')

    # roepot@gmail.com
    # tzeniamorphy@gmail.com
    # jose25garcia@hotmail.com
    # efthimis80@hotmail.com
    # george.dumitriu.jz@gmail.com
    # baswiegers@gmail.com
    # kieranklaassen@gmail.com
    # katamiaennoia@gmail.com


  end

  def self.set_group_b
    # A2.1 Richard Roelof Iro Els
    # B2.1 Efthimis Pepe Tzeni Kieran
    # C2.1 Bas George Thanasis

    User.where(email: ['richardehaynes@me.com', 'roepot@gmail.com', 'chioti22@yahoo.com', 'elsamondelaers@gmail.com']).update_all room: find_by(name: 'kitchen-a')
    User.where(email: ['efthimis80@hotmail.com', 'jose25garcia@hotmail.com', 'tzeniamorphy@gmail.com', 'kieranklaassen@gmail.com']).update_all room: find_by(name: 'kitchen-b')
    User.where(email: ['baswiegers@gmail.com', 'george.dumitriu.jz@gmail.com', 'katamiaennoia@gmail.com']).update_all room: find_by(name: 'kitchen-c')

  end
end
