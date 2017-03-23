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
#  youtube_id    :string
#  youtube_start :string
#  youtube_end   :string
# gesture: [:view, :speak, :watch]


Cue.delete_all

# View
Cue.create!(
  active: true,
  gesture: :view,
  partial_name: 'link',
  name: 'Welcome',
  subtitle: 'jajaja',
  position: 1,
  duration: 5
)

Cue.create!(
  active: true,
  gesture: :speak,
  text: "Hi marta!! yoyo hey hey",
  name: 'Welcome',
  subtitle: 'subtitltelelt',
  position: 2,
  duration: 5
)

Cue.create!(
  active: true,
  gesture: :watch,
  youtube_id: 'b72uaZiIJpA',
  youtube_start: '10',
  youtube_end: '15',
  name: 'Welcome',
  subtitle: 'jajaja',
  position: 3,
  duration: 5
)
