require 'sinatra'

# This is a 'route'
## We are telling Sinatra that if the home, or 'route', URL '/' is 
## requested, using the Get HTTP method, display "Hello,World!"
get '/' do
  "Hello, World!"
end

get '/about' do
  'A little about me.'
end

# Accessing URL Parameters, where anything after /hello/
# will be apart of the params array 'name' and 'city'
get '/hello/:name/:city' do
  "Hello there, #{params[:name].upcase} from #{params[:city].reverse}."
end  

# * = wilddcard query strings 'splat' anything after /more/
# will be accessable through :splat key in the params array.
get '/more/*' do
  params[:splat]
end

# Loads the form.erb ERB(Embedded Ruby) file from views/ directory.
# ERB files are usually HTML files which have ruby code within tags.
# These are parsed before being sent to the browser.
get '/form' do
  erb :form
end  

post '/form' do
  "You said '#{params[:message]}'"
end

# encrypting the message so it can only be read by the intended recepiant
get '/secret' do
  erb :secret
end

post '/secret' do
 params[:secret].reverse
end

get'/decrypt/:secret' do
  params[:secret].reverse
end


get '/what' do
  erb :alex
end

# Displaying our own error for a 404
#not_found do
#  status 404
#  "not found"
#end

not_found do
  halt 404, "Page not found"
end
