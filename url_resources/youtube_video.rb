class YoutubeVideo < UrlResource
  
  PATTERN = %r{\Ahttps?://(?:www\.)?(?:(?:youtube\.com\/watch\?v=)|(?:youtu\.be/))([^"&?/ ]{11})}
  
  def initialize(url)
    super(url)
  end
  
  def attributes
    { type: 'youtube', url: url, title: title, description: description, id: id, embed_code: embed_code }  
  end
  
  def embed_code
    CGI.escapeHTML %Q{<iframe width="560" height="315" src="http:\/\/www.youtube.com\/embed\/#{ id }" frameborder="0" allowfullscreen><\/iframe>}
  end

  def id
    if query.try(:[], 'v').present?
      query['v'].first.to_s
    elsif m = uri.path.match(/\/([^"&?\/ ]{11})/i)
      m[1]
    end
  end
end
