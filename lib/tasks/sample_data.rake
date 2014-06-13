require "prawn"


namespace :db do
desc "test gen pdf"
task genpdf: :environment do

words_to_pdf_test
end


def words_to_pdf
	Prawn::Document.generate("hello.pdf") do
      data = [ ["Item", "Jan Sales", "Feb Sales"],
			 ["Oven", 17, 89],
			 ["Fridge", 62, 30],
			 ["Microwave", 71, 47]
			 ]
			table(data) do
			 values = cells.columns(1..-1).rows(1..-1)
			 
			 # bad_sales = values.filter do |cell|
			 # cell.content.to_i < 40
			 # end
			 
			 # bad_sales.background_color = "FFAAAA"
			 # good_sales = values.filter do |cell|
			 # cell.content.to_i > 70
			 # end
			 
			 # good_sales.background_color = "AAFFAA"
			end

     end
end

def words_to_pdf_test
	Prawn::Document.generate("hello.pdf") do
	  words = Word.all
	  @data = []
	  @data << Array.new(["Category" ,"Japanese", "Vietnamese"])
	  
	  words.each do |w|
		category = (Category.find_by_id w.category_id)
		japanese = w.name
	  	vietnamese = WordValue.where(id: w.id, correct: true)
	  	@data << Array.new{[category.name, japanese, vietnamese]}
	  end

		table(@data) do
			 values = cells.columns(1..-1).rows(1..-1)		 
		end
     end
end

end