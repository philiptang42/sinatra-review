require 'sinatra'

get '/groceries' do
  groceries = File.readlines('grocery_list.txt')
  erb :index, locals: { groceries: groceries }
end

post '/groceries' do
  grocery = params['grocery']

  File.open('grocery_list.txt', 'a') do |file|
    file.puts(grocery)
  end

  redirect '/groceries'
end

post '/groceries/:grocery_name' do
  erb :individual
end
