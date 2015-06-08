require 'pry'
require "etsiest/version"
require 'sinatra'

require 'etsy'
Etsy.api_key = ENV['ETSY_KEY']

get '/search' do
  @results = Etsy::Request.get('/listings/active',
             :includes => ['Images', 'Shop'],
             #:keywords => 'whiskey') 
             :keywords => params['query'])
  #binding.pry
  erb :index
end

# binding.pry

# module Etsiest
#   class EtsySearch < Sinatra::Base
#       get '/etsy_search' do
#         @results = Etsy::Request.get('/listings/active',
#           :includes => ['Images', 'Shop'],
#           :keywords => 'whiskey')
#       end

##      ruby lib/foo.rb, then $0 'lib/foo.rb' (explanation of line 24)
#       run! if app_file == $0
#   end
# end