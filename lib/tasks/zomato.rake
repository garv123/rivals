namespace :zomato do
  desc "TODO"
  task json: :environment do
  	File.open("zomato.json", "r").each_line do |line|
  		line=JSON.parse(line)
		name=line["name"].tr('^A-Za-z0-9| ', '')
  		locality=line['locality'].tr('^A-Za-z0-9| ', '')
  		Restaurant.create!(name:name,location:locality)
  	end
  end

end
