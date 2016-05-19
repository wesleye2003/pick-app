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

#Genres
rock = Genre.create(name: "Rock")
hip_hop = Genre.create(name: "Hip Hop")
funk = Genre.create(name: "Funk")
jazz = Genre.create(name: "Jazz")
classic = Genre.create(name: "Classical")
alt = Genre.create(name: "Alternative")
rb = Genre.create(name: "R&B")

#Roles
drum = Role.create(name: "Drummer")
vocal = Role.create(name: "Vocalist")
guitar = Role.create(name: "Guitarist")
bass = Role.create(name: "Bassist")
piano = Role.create(name: "Pianist")


wes = User.new(username: "Wesley El-Amin",
		       description: "I bring the bass every place I go.",
		       zipcode: '60610',
               avatar_url: 'http://i.imgur.com/yPyPWD4.png')
wes.password = "password"
wes.city = 'Chicago'
wes.save

josh = User.new(username: "joshulu",
		        description: "Piano is the (pentatonic) key to my heart.",
	            zipcode: '60506',
                avatar_url: 'http://i.imgur.com/yPyPWD4.png')
josh.password = "password"
josh.city = 'Chicago'
josh.save

david = User.new(username: "David Kaiser",
		        description: "Rock Dove by day, Rocker by night.",
		        zipcode: '60201',
                avatar_url: 'http://i.imgur.com/yPyPWD4.png')
david.password = "password"
david.city = 'Chicago'
david.save


erica = User.new(username: "Erica",
            description: "",
            zipcode: '60611',
            avatar_url: 'http://i.imgur.com/yPyPWD4.png')
erica.password = "password"
erica.city = 'Chicago'
erica.save

dave = User.new(username: "Dave Hostios",
            description: "No description yet.",
            zipcode: '60610',
            avatar_url: 'http://i.imgur.com/yPyPWD4.png')
dave.password = "password"
dave.city = 'Chicago'
dave.save

stevie = User.new(username: "Stevie Ray",
                   description: "I play guitar and sing.",
                   zipcode: '78704', 
                   avatar_url: 'http://cps-static.rovicorp.com/3/JPG_400/MI0001/399/MI0001399374.jpg?partner=allrovi.com',
                   permalink: "https://soundcloud.com/stevie-ray-vaughan-official")
stevie.password = "password"
stevie.city = 'Austin'
stevie.save

james = User.new(username: "James Brown",
            description: "THE king of soul.",
            zipcode: '60606',
            avatar_url: 'http://a2.files.biography.com/image/upload/c_fill,cs_srgb,dpr_1.0,g_face,h_300,q_80,w_300/MTIwNjA4NjMzNzU0ODQ2NzMy.jpg',
            permalink: 'https://soundcloud.com/jamesbrownofficial')
james.password = "password"
james.city = 'Chicago'
james.save

drake = User.new(username: "Drake",
            description: "You used to call me on my cell phone :(",
            zipcode: '60606',
            avatar_url: 'http://assets.rollingstone.com/assets/images/video/drake-takes-on-lil-wayne-jay-z-and-a-rod-on-snl-20140119/20140118-drake-thumb-306x306-1390145726.jpg',
            permalink: 'https://soundcloud.com/beats1ovosoundradio')
drake.password = "password"
drake.city = 'Chicago'
drake.save

frank = User.new(username: "Frank Zappa",
            description: "Self-explanatory...",
            zipcode: '60606',
            avatar_url: 'http://www.allaboutjazz.com/media/large/8/0/a/54d540396974b94487453454281ea.jpg',
            permalink: 'https://soundcloud.com/frankzappa')
frank.password = "password"
frank.city = 'Chicago'
frank.save

ray = User.new(username: "Ray Charles",
            description: "Georgia on my mind",
            zipcode: '60606',
            avatar_url: 'http://spectrummagazine.org/sites/default/files/imagecache/large_article_image/files/RayCharles.jpg',
            permalink: 'https://soundcloud.com/raycharles')
ray.password = "password"
ray.city = 'Chicago'
ray.save

bey = User.new(username: "Beyoncé",
            description: "Queen of the Beyhive.",
            zipcode: '60606',
            avatar_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhqyMvL8696Yt5XIlTp_bmRUim2TbUDSOClW6m-WFqI5UF6x_U',
            permalink: 'https://soundcloud.com/beyonce')
bey.password = "password"
bey.city = 'Chicago'
bey.save


# Add Roles
piano.users << [ray, josh, erica, ray, bey]
drum.users << [josh, erica, david]
vocal.users << [drake, ray, frank, james, bey]
guitar.users << [dave, david, frank]
bass.users << [wes, drake]


# Add Genres
rock.users << [josh, frank, dave, david]
hip_hop.users << [wes, drake, josh]
jazz.users << [wes, ray, james, erica]
funk.users << [james, ray, david]
classic.users << [frank, james, stevie, wes]
alt.users << [dave, erica]
rb.users << [bey, drake, james]

#Add Requests
drake.request(wes)
david.request(wes)
dave.request(wes)
josh.request(wes)
erica.request(wes)
bey.request(wes)




# Add Searched Roles
wes.s_roles << [guitar, vocal, guitar, piano]
