# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10時〜18:00まで30分単位で枠を作成(計16枠)
16.times do |n|
  TimeFrame.create!(
      start_at: (Time.zone.parse("10:00") + 30.minutes * n).strftime("%H:%M"),
      end_at: (Time.zone.parse("10:30") + 30.minutes * n).strftime("%H:%M")
  )
end
