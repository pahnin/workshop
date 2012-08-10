require 'sequel'

DB = Sequel.connect("sqlite://database.db")

DB.create_table :entry do
	primary_key :id
	String :name
	String :comment, :text=> true
end