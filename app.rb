entry = DB[:entry]
Cuba.use Rack::Static, urls: %w(/css /js /lib /plugin), root: "public"
Cuba.define do
  on get do
  	
  	on "submit" do
  		res.redirect "/"
  	end

    on "enter" do
      res.write File.read('template.html')
    end

    on root do
    	
    	res.write File.read("public/index.html")

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
