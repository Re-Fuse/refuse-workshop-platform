# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


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
#  youtube_indentifier    :string
#  youtube_start :string
#  youtube_end   :string
# gesture: [:view, :speak, :watch]

unless User.find_by(email: 'bot@bot.com').present?
  User.create!(
    email: 'bot@bot.com',
    password: 'sdfsdfsdfsdfg434g',
    name: '👻'
  )
end

User.where(email: ['kieranklaassen@gmail.com', 'katamiaennoia@gmail.com']).update_all director: true
