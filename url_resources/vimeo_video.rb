class VimeoVideo < UrlResource
  
  PATTERN = %r{\Ahttps?://(?:www\.)?vimeo.com/\d+}
  
  def initialize(url)
    super(url)
  end
  
  def attributes
    { type: 'vimeo', url: url, title: title, description: description, id: id, embed_code: embed_code }  
  end
  
  def embed_code
    CGI.escapeHTML %Q{<iframe src="http:\/\/player.vimeo.com\/video/#{ id }?color=ffffff" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen><\/iframe>}
  end
  
  def id
    uri.path.match(/\/(\d+)/)[1]
  end
  
private

  def retrieve(url)
    url = url.gsub(/https/i, 'http')
    @doc = Pismo::Document.new(url)
  end
  
end