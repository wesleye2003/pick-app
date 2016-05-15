# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Genre.destroy_all
GenreSelection.destroy_all
Role.destroy_all
ArtistRole.destroy_all
Picking.destroy_all
SearchedRole.destroy_all

user1 = User.new(username: "Wesley El-Amin",
						permalink: "www.soundcloud.com/wesley-el-amin",
						description: "Hey I play music",
						zipcode: '60610')
user1.password = "password"
user1.save

user2 = User.new(username: "Stix McGee",
						permalink: "www.soundcloud.com/drumbum01",
						description: "I play drums",
						zipcode: '60610')
user2.password = "password"
user2.save

user3 = User.new(username: "String bean",
						permalink: "www.soundcloud.com/stringthing32",
						description: "I play guitar",
						zipcode: '60610')
user3.password = "password"
user3.save

rock = Genre.create(name: "Rock")
classic = Genre.create(name: "Classical")
funk = Genre.create(name: "Funk")
jazz = Genre.create(name: "Jazz")
drum = Role.create(name: "Drummer")
vocal = Role.create(name: "Vocalist")
guitar = Role.create(name: "Guitarist")
bass = Role.create(name: "Bassist")

user2.genres << funk
user2.genres << rock

user3.genres << rock
user3.genres << funk


user1.genres << classic
user1.genres << jazz
user1.genres << rock

user1.roles << bass
user2.roles << drum
user3.roles << guitar

user1.request(user2)
user2.request(user1)
user1.approve_picking(user2)

user1.request(user3)

user1.s_roles << guitar
user1.s_roles << drum
user1.s_roles << vocal