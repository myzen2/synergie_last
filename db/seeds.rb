# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Forem::Category.create!(:name => 'Jeux')

user = User.create(
  :pseudo => "myzen2",
  :email => "admin@example.com",
  :password => "admin1234"
)
user.forem_admin = true
user.save!
user.update_attribute(:forem_state, 'approved')

unless user.nil?
  forum = Forem::Forum.create(:category_id => Forem::Category.first.id, :name => "Default", :description => "Default forem created by install")

  topic1 = forum.topics.build({ :subject => "Fifa", :posts_attributes => [:text => "Jouez à fifa c'est cool"] })
  topic1.user = user
  topic1.save!

  topic2 = forum.topics.build({ :subject => "LOL", :posts_attributes => [:text => "Super jeu pour faire de l'e-Sport"] })
  topic2.user = user
  topic2.save!

  topic3 = forum.topics.build({ :subject => "Blade and Soul", :posts_attributes => [:text => "C'est super comme jeu."] })
  topic3.user = user
  topic3.save!

  topic4 = forum.topics.build({ :subject => "Day Z", :posts_attributes => [:text => "Tirez sur tout ce qui bouge et sauvez-vous."] })
  topic4.user = user
  topic4.save!

end
