# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cue.delete_all

Cue.create!(
  active: false,
  name: 'Tetie',
  position: 1,
  action: 'cue_1',
  duration: 5
)

Cue.create!(
  active: true,
  name: 'JOJO',
  position: 2,
  action: 'cue_2',
  duration: 5
)

Cue.create!(
  active: false,
  name: 'Tesdfdsfstie',
  position: 3,
  action: 'cue_3',
  duration: 5
)
