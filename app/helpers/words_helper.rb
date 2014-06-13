require "csv"
module WordsHelper
	def upload_data
		File.open("words.tsv", "r").each_line do |line|
			data = line.split(/\t/)
  			category_id, content = data.map{|d| d.split(": ")[1] }.flatten
  			word = Word.new
  			word.category_id = category_id
  			word.name = content
  			word.save
		end
	end

# TODO backup function
# require "prawn"
# 	def words_to_pdf_test
# 	Prawn::Document.generate("hello.pdf") do
# 	  words = Word.all
# 	  @data = []
# 	  @data << Array.new(["Category" ,"Japanese", "Vietnamese"])
	  
# 	  words.each do |w|
# 		category = (Category.find_by_id w.category_id)
# 		japanese = w.name
# 	  	vietnamese = WordValue.where(id: w.id, correct: true)
# 	  	@data << Array.new{[category.name, japanese, vietnamese]}
# 	  end

# 		table(@data) do
# 			 values = cells.columns(1..-1).rows(1..-1)		 
# 		end
#      end
# end


end