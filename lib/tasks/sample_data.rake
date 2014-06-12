namespace :db do

desc 'Fill database with sample data'
task populate: :environment do

gen_users
gen_categories
gen_tsv_file

end


def gen_users
	User.create!(name: 'Super User',
	email: 'super@rails.org',
	password: 'qwerty',
	password_confirmation: 'qwerty',
	role: 1)

	20.times do |n|
	name = Faker::Name.name
	email = 'student-#{n+1}@railstutorial.org'
	password = 'qwerty'
	User.create!(name: name,
	email: email,
	password: password,
	password_confirmation: password,
  role: 0)
  end

  5.times do |n|
    name = Faker::Name.name
    email = 'teacher-#{n+1}@railstutorial.org'
    password = 'qwerty'
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 role: 2)
    end
end

	
def gen_categories
	10.times do |_|
	  title  = Faker::Lorem.words(8).join(' ')
   	description  = Faker::Lorem.sentence(rand(2..8))
	  Category.create!(
        name: title,
        description: description,
        thumbnail: 'http://www.google.com.vn/imgres?imgurl=http%3A%2F%2Ftm222.dd14.firma5.com%2Fwp-content%2Fuploads%2FBild11.jpg&imgrefurl=http%3A%2F%2Fwww.liftstueberl.com%2Fen%2F&h=1110&w=1654&tbnid=fQVn9I9IbVf57M%3A&zoom=1&docid=jdckOiOcN_q8iM&ei=VryXU6mYOM7m8AXcu4H4BQ&tbm=isch&ved=0CC8QMygBMAE&iact=rc&uact=3&dur=2986&page=1&start=0&ndsp=15',
        word_limit: 2 + rand(5) + rand(6)
    )
	end
end


def gen_tsv_file
  # cates = Category.all
  # 30.times do |i|
  #   CSV.open('words.tsv', 'wb', @targetdelimiter.gsub('\t','\t')) do |csv|
  #
  #     csv << ['animal', 'count', 'price']
  #     csv << ['fox', '1', '$90.00']
  #   end
  # end
end

end