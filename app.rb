require "cuba"
require "sequel"
DB = Sequel.connect("sqlite://database.db")
DB[:entry].delete
entry = DB[:entry]
Cuba.define do
  on get do
  	
  	on "submit" do
  		res.redirect "/"
  	end

    on "enter" do
      res.write File.read('template.html')
    end

    on root do
    	
    	res.write "<a href='/enter'>Enter Comment</a><br>"

       	entry.each do |data|

    		res.write "#{data[:name]} : -#{data[:comment]} <br> <br>"
    	end

    end
   end

    on post do
    	on "submit" do
    		on param("name"),param("comment") do |name,comment|
    			if((!name.nil?) && (!comment.nil?))
    				entry.insert(:name => name, :comment => comment)
    				res.redirect "/"
    			else
    				res.redirect "enter"
    			end
    		end

    		on true do
    			res.write "you are not supposed to be here "
    		end

    	end
    end  
end
