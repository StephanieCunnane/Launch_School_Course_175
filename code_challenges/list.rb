require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'pry'

#get %r(/cat([1-5])) do |num|
#  @num = num
#  template = '<img src="cat<%= @num %>.jpeg">'
#  erb template
#end

get '/' do
  @files = Dir.glob('public/*').map { |file| File.basename(file) }.sort
  @files.reverse! if params[:sort] == 'desc'
  erb :list
end
