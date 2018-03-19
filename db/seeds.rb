# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Robocop' }])
#   Character.create(name: 'Luke', movie: movies.first)

playlist1 = Playlist.create! name: 'Cool Playlist'

poster1 = Poster.create! name: 'Welcome to Pittsburgh'
poster2 = Poster.create! name: 'Cityscape'
poster3 = Poster.create! name: 'Things to do'

playlist1.playlist_items.create! position: 1, poster: poster1
playlist1.playlist_items.create! position: 2, poster: poster2
playlist1.playlist_items.create! position: 3, poster: poster3
