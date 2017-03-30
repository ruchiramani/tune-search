# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
artist = Artist.create(name: 'drake')
album = Album.create(name: "views", artist_id: artist.id)
song = Song.create(name: 'hotline bling', artist_id: artist.id, album_id: album.id)
