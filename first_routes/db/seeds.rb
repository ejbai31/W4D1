# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create( [ { username: 'E'}, {username: 'j' }, {username: 'Da Vinci'} ] )

artworks = Artwork.create ( [ {
  title: 'Mona Lisa',
  image_url: 'https://media1.britannica.com/eb-media/77/192577-049-F870243D.jpg',
  artist_id: users.last.id
  },
  {
    title: 'Roger the rabbit',
    image_url: 'https://media1.britannica.com/eb-media/77/192577-049-F870243D.jpg',
    artist_id: users.first.id }
    ])

ArtworkShare.create ([{ viewer_id: users.first.id, artwork_id: artworks.first.id},
{ viewer_id: users.last.id, artwork_id: artworks.first.id}
  ])

Comment.create([{body: 'Lorem', user_id: users.first.id, artwork_id: artworks.first.id}])
