require "cuba"
require "sequel"
DB = Sequel.connect("sqlite://database.db")
DB[:log].delete
log = DB[:log]
Cuba.define do
  on get do
  	
    on root do
    	
        addr =  env['REMOTE_ADDR']
        k = log.where(:ip => addr).count
        p k
        p k.nil?
       if(k == 0)
          log.insert(:ip => addr,:time => Time.now.to_i.to_s)
      else
            k = log.where(:ip => addr)
          k.each do |data|

            temp = data[:time].to_i
            p temp
            now = Time.now.to_i
            diff = now-temp
            p diff
            k.update(:time => now)
            if diff/60
            p discount
            res.write "You get a discount of #{discount}% "
          end
      end
    

    end
   end

end
