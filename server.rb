require 'sinatra'
require 'erb'

def groceries
  result = []
  CSV.foreach(grocery_list.csv) do |row|
    result << row.to_hash
  end
  result
end

get '/' do
  redirect '/groceries'
end

get '/groceries' do
  groceries = File.readlines('grocery_list.csv')
	erb :index, locals: { groceries: groceries }
end

post '/groceries' do
	  grocery = params['grocery_item']
	  quantity = params['quantity']

	  File.open('grocery_list.csv', 'a') do |file|
	    file.puts("#{grocery}")
	    quantity
	  end

	  redirect '/'
  end

get '/groceries/:grocery' do
  groceries = File.readlines('grocery_list.csv')


	erb :individual


end
