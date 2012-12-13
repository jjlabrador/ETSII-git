$: << '.' # add current path to the search path
require 'sinatra/activerecord/rake'
require 'app'
=begin
desc "Reset the data base to initial state"
task :clean do
	sh "mv shortened_urls.db tmp/"
	sh "mv db/migrate /tmp/"
end

desc "Create the specific ActiveRecord migration for this app"
task :create_migration do
	sh "rake db:create_migration NAME=create_shortened_urls"
end

desc "shows the code you have to have in your db/migrate/#number_shortened_urls.rb file"
task :edit_migration do
	source = <<EOS
	class ShortenedUrls < ActiveRecord::Migration
	def up
	create_table :shortened_urls do |t|
	t.string :url
	end
	add_index :shortened_urls, :url
	end
	
	def down
	drop_table :shortened_urls
	end
	end
	EOS
	puts "Edit the migration and insert this code:"
	puts source
end

desc "run the url shortener app"
task :run do
	sh "ruby app.rb"
end
=end