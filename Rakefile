require 'sequel'
require 'sqlite3'
namespace :db do
	task :create do
		if File.exist?('db/database.db')
			puts "Database file exist. use 'rake db:recreate' to overwrite current database"
		else
			SQLite3::Database.new("db/database.db")
			DB = Sequel.connect("sqlite://db/database.db")
			DB.create_table :entry do
				primary_key :id
				String :name
				String :comment, :text=> true
			end
		end
	end

	task :overwrite do
		if File.exist?('db/database.db')
			File.delete('db/database.db')
			puts "Deleted database file. Creating new.."
		end
		DB = Sequel.connect("sqlite://db/database.db")
		DB.create_table :entry do
			primary_key :id
			String :name
			String :comment, :text=> true
		end
	end
end
task :default do
	puts "rake db:create      ---     create database"
	puts "rake db:create      ---     overwrite existing database"
end