class StopsController < ApplicationController

  def index
		@all_stops = Stop.all
  
  end
  
  def map_me
  	@map_me
  end	  
  	 	
  def distance loc1, loc2
  	rad = Math::PI / 180
  	lat1, lon1 = loc1
    lat2, lon2 = loc2
    dLat = (lat2-lat1) * rad;
    dLon = (lon2-lon1) * rad;
    a = Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.cos(lat1 * rad) * Math.cos(lat2 * rad) *
        Math.sin(dLon/2) * Math.sin(dLon/2);
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    
    return c
    
  end
   	
end
