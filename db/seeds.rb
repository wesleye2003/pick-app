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

user101 = User.new(username: "Stevie Ray",
            permalink: "www.soundcloud.com/texasflood",
            description: "I play guitar and sing",
            zipcode: '78704')
user101.password = "password"
user101.save

user102 = User.new(username: "Eric C",
            permalink: "www.soundcloud.com/cream",
            description: "One time guitar deity",
            zipcode: '90024')
user102.password = "password"
user102.save

user103 = User.new(username: "H Wolf",
            permalink: "www.soundcloud.com/sweethomechicago",
            description: "Bluesman",
            zipcode: '60610')
user103.password = "password"
user103.save

user104 = User.new(username: "Prince",
            permalink: "www.soundcloud.com/revolution",
            description: "His Purple Majesty",
            zipcode: '60610')
user104.password = "password"
user104.save

user105 = User.new(username: "Declan McKenna",
            permalink: "www.soundcloud.com/brazil",
            description: "Alt-dude",
            zipcode: '60610')
user105.password = "password"
user105.save

user106 = User.new(username: "Frank Sinatra",
            permalink: "www.soundcloud.com/OldBlueEyes",
            description: "Chairman Of The Board",
            zipcode: '60606')
user106.password = "password"
user106.save

user107 = User.new(username: "Drake",
            permalink: "www.soundcloud.com/Drake",
            description: "I got a new album coming out",
            zipcode: '60606')
user107.password = "password"
user107.save

user108 = User.new(username: "David Bowie",
            permalink: "www.soundcloud.com/ZiggyStardust",
            description: "The thin white duke",
            zipcode: '60606')
user108.password = "password"
user108.save

user109 = User.new(username: "Frank Zappa",
            permalink: "www.soundcloud.com/Zap",
            description: "Self-explanatory",
            zipcode: '60606')
user109.password = "password"
user109.save

user110 = User.new(username: "Ray Charles",
            permalink: "www.soundcloud.com/RC",
            description: "Georgia on my mind",
            zipcode: '60606')
user110.password = "password"
user110.save

user111 = User.new(username: "Bootsy Collins",
            permalink: "www.soundcloud.com/Bootsy",
            description: "I put the 'fun' in 'funk'",
            zipcode: '60606')
user111.password = "password"
user111.save

user112 = User.new(username: "Charlie Mingus",
            permalink: "www.soundcloud.com/bebop",
            description: "stand up bass",
            zipcode: '60606')
user112.password = "password"
user112.save

user113 = User.new(username: "Johann",
            permalink: "www.soundcloud.com/bach",
            description: "inventions, fugues",
            zipcode: '60606')
user113.password = "password"
user113.save

user114 = User.new(username: "Art Blakey",
            permalink: "www.soundcloud.com/jazzdrums",
            description: "nothing but jazz",
            zipcode: '60606')
user114.password = "password"
user114.save


#Genres
rock = Genre.create(name: "Rock")
classic = Genre.create(name: "Classical")
funk = Genre.create(name: "Funk")
jazz = Genre.create(name: "Jazz")

#Roles
drum = Role.create(name: "Drummer")
vocal = Role.create(name: "Vocalist")
guitar = Role.create(name: "Guitarist")
bass = Role.create(name: "Bassist")


# Add Genres
user1.genres << classic
user1.genres << jazz
user1.genres << rock

user2.genres << funk
user2.genres << rock

user3.genres << rock
user3.genres << funk

user101.genres  << rock
user102.genres  << rock
user103.genres  << rock
user103.genres  << jazz
user104.genres  << rock
user104.genres  << funk
user105.genres  << rock
user106.genres  << jazz
user107.genres  << rock
user108.genres  << rock
user109.genres  << rock
user110.genres  << rock
user110.genres  << funk
user110.genres  << jazz
user111.genres  << rock
user111.genres  << funk
user112.genres  << jazz
user113.genres  << classic
user114.genres  << classic
user114.genres  << jazz

# Add Roles
user1.roles << bass
user2.roles << drum
user3.roles << guitar
user3.roles << bass

user101.roles  << guitar
user101.roles  << vocal
user102.roles  << vocal
user103.roles  << vocal
user104.roles  << vocal
user102.roles  << guitar
user103.roles  << guitar
user104.roles  << guitar
user105.roles  << vocal
user106.roles  << vocal
user107.roles  << vocal
user108.roles  << vocal
user108.roles  << guitar
user109.roles  << vocal
user109.roles  << guitar
user110.roles  << vocal
user111.roles  << bass
user112.roles  << bass
user113.roles  << guitar
user114.roles  << drum

#Add Requests
user1.request(user2)
user2.request(user1)
user1.approve_picking(user2)
user101.request(user103)
user102.request(user101)
user103.request(user102)
user104.request(user102)
user105.request(user101)
user105.request(user109)
user106.request(user103)
user107.request(user106)
user108.request(user106)
user109.request(user101)
user109.request(user108)
user109.request(user107)
user109.request(user106)
user109.request(user105)
user111.request(user101)
user111.request(user103)
user111.request(user104)
user111.request(user110)
user112.request(user101)
user101.request(user112)

user102.approve_picking(user101)
user109.approve_picking(user105)
user112.approve_picking(user101)


# Add Searched Roles
user1.s_roles << guitar
user1.s_roles << drum
user1.s_roles << vocal
user2.s_roles << vocal
user3.s_roles << guitar
user101.s_roles << guitar
user102.s_roles << guitar
user103.s_roles << bass
user104.s_roles << vocal
user105.s_roles << drum
user106.s_roles << drum
user107.s_roles << bass
user108.s_roles << guitar
user108.s_roles << bass
user109.s_roles << vocal
user110.s_roles << guitar
user111.s_roles << bass
user112.s_roles << vocal
