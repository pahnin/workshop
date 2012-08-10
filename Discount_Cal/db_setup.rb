require 'sequel'

DB = Sequel.connect("sqlite://database.db")

DB.create_table :log do
	primary_key :id
	String :ip
	String :time
end