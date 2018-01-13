require 'rubygems'
require 'bundler/setup'

Bundler.require

require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "foo.sqlite3"}

class Contact < ActiveRecord::Base
  validates_presence_of :name
end

get '/' do
  @now = Time.now
  erb :index
end

get '/contact_new' do
  erb :contact_form
end

post '/contacts' do
  p params

  # DBにデータを保存する
  name = params[:name]
  contact = Contact.new({name: name})
  contact.save

  redirect '/'
end