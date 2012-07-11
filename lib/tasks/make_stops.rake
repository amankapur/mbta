task :make_stops => :environment do
	require 'nokogiri'
	require 'open-uri'

	all_routes = 'http://webservices.nextbus.com/service/publicXMLFeed?command=routeList&a=mbta'


	doc = Nokogiri::XML(open(all_routes)) do |config|
	  config.strict.nonet
	end

	tags = doc.css('route').map do |i| 
	  {'tag' => i.attribute('tag').value}
	end

	tags.each do |tag_number|
		puts 'GETTING STOPS FOR BUS ' + tag_number['tag']
		route_url = 'http://webservices.nextbus.com/service/publicXMLFeed?command=routeConfig&a=mbta&r=' + tag_number['tag']
		doc = Nokogiri::XML(open(route_url)) do |config|		
  		config.strict.nonet
		end
		stops = []
	
		doc.css('stop').map do |i|
  	  if i.attribute('title') != nil && i.attribute('stopId') != nil
  			stops << {
  			 'stop_tag' => tag_number['tag'],
  			 'stupid_tag' => i.attribute('tag').value,
				 'title' => i.attribute('title').value,	
				 'lat' => i.attribute('lat').value,
				 'lon' => i.attribute('lon').value,
				 'stop_id' => i.attribute('stopId').value }
			end
		end
		
		stops2 = []
		stops.each do |i|	
			if i != nil
				stops2 << i
			end
		end
		#puts 'ADDING STOPS '
		#puts stops2
		
		stops2.each do |stop|

			if Stop.where(stop_id: stop['stop_id']) == []
				Stop.create(stop)

			end
		end
		
	end
	
end
