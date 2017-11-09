require 'sinatra'

require_relative 'utils'

get '/' do
  'Home page'
end

# end point for starting browser
get '/start/?' do
  check_for_proxy(params)
  browser = params[:browser]
  url = params[:url]
  open browser, url
end

# end point for closing browser
get '/close/?' do
  browser = params[:browser]
  close browser # utility function to close browser
end

# end point for cleaning browser
get '/clean/?' do
  browser = params[:browser]
  close browser # close so that profiles can be deleted
  cleanup browser # utiliy function to clean browser
end
