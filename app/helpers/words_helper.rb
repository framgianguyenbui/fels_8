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
end