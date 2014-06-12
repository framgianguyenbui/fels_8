# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

	# gen_users
 #    gen_categories
 #    gen_tsv_file

 #    def gen_users

    password = "qwerty"
    domain = "@rails.com"

    admin = User.new
    admin.name = "Super User"
    admin.email = "super" + domain
    admin.password = password
    admin.password_confirmation = password
    admin.role = 1
    admin.avatar = "http://www.gfi.com/blog/wp-content/uploads/2012/06/Admin-Pet-Peeves.jpg"
    admin.save

    20.times do |n|
      name = Faker::Name.name
      email = "student-#{n+1}" + domain
      user = User.new
      user.name = name
      user.email = email
      user.password = password
      user.password_confirmation = password
      user.role = 0
      user.avatar = "http://www.abroadstudy.net/wp-content/uploads/students-safety.jpg"
      user.save
    end

    5.times do |n|
      name = Faker::Name.name
      email = "teacher-#{n+1}" + domain
      user = User.new
      user.name = name
      user.email = email
      user.password = password
      user.password_confirmation = password
      user.role = 2
      user.avatar = "http://m.c.lnkd.licdn.com/mpr/mpr/p/4/005/05a/3be/0efa8aa.jpg"
      user.save

    end

  # end


  # def gen_categories

    10.times do
      title  = Faker::Lorem.words(rand(6..10)).join(' ')
      description  = Faker::Lorem.sentence(rand(21..28))
      cate = Category.new
      cate.name = title
      cate.description = description
      cate.thumbnail = 'http://tm222.dd14.firma5.com/wp-content/uploads/Bild11-600x402.jpg'
      cate.word_limit = 2 + rand(5) + rand(6)
      cate.save
    end
  # end

  #gen words.tsv file that contains words
  # def gen_tsv_file
    cates = Category.all    
    
      CSV.open("words.tsv", "wb") do |tsv|
        30.times do
          cates.each do |cat|
          title = Faker::Lorem.words(rand(1..2)).join('')
          tsv << ['category_id: ' + cat.id.to_s + "\t" + 'content: ' + title ]

        end
      end
    # end

    #upload words from tsv file to db
    File.open("words.tsv", "r").each_line do |line|
			data = line.split(/\t/)
  			category_id, content = data.map{|d| d.split(": ")[1] }.flatten
  			word = Word.new
  			word.category_id = category_id
  			word.name = content
  			word.save
		end


	#gen meaning options for each word
	words = Word.all

		4.times do |n|
          words.each do |w|
          title = Faker::Lorem.words(rand(2..5)).join('')
          word_val = WordValue.new
          word_val.word_id = w.id
          word_val.name = title
          word_val.correct = n==1 ? 1:0  
          word_val.save

        end
      end
        	
  end