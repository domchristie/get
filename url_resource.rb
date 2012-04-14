# encoding: UTF-8
class UrlResource
  
  # liberal url regex pattern: http://daringfireball.net/2010/07/improved_regex_for_matching_urls
  PATTERN = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}
  
  attr_accessor :url, :title, :description, :favicon, :html_body
  
  def initialize(url)
    retrieve(url)
    self.url = url
    self.title = @doc.title
    self.description = @doc.description
    self.favicon = @doc.favicon
    self.html_body = @doc.html_body
  end
  
  def attributes
    { type: 'page', url: url, title: title, description: description, favicon: favicon, html_body: CGI.escapeHTML(html_body) }  
  end
  
  def id
    nil
  end
  
  def uri
    @uri ||= URI.parse(url)
  end
  
  def query
    @query ||= CGI::parse(uri.query) unless uri.query.nil?
  end
  
private
  
  def retrieve(url)
    @doc = Pismo::Document.new(url)
  end
  
end