require 'uri'
require 'cgi'
require 'active_support/core_ext/object'
require './url_resource'
Dir["./url_resources/*.rb"].each {|file| require file }

class Get < Sinatra::Base
  helpers Sinatra::Jsonp
  
  get '/' do
    type = detect_type(params[:url])
    jsonp type.new(params[:url]).attributes
  end
  
  def detect_type(url)
    [YoutubeVideo, VimeoVideo, UrlResource].find { |r| r::PATTERN =~ url }
  end
  
end
