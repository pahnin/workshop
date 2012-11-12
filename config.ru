require "cuba"
require "sequel"
if File.exist?('db/database.db')
	DB = Sequel.connect("sqlite://db/database.db")
	require './app'
	run Cuba
else
	puts "setup your database using 'rake db:create'"
	exit
end