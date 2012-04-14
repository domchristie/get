A Sinatra app that retrieves machine-readable information from web pages and generates embed code if it's a known type.

Currently supports:

* YouTube videos (including 'short' format)
* Vimeo videos

Plans to include:

* Flickr
* Instagram
* SoundCloud
* Spotify
* Tomahawk
* Twitter

## Example
A live (experimental) example exists at http://gentle-stream-2944.herokuapp.com/ :

    GET http://gentle-stream-2944.herokuapp.com/?url=http://www.youtube.com/watch?v=1iYElrdil-M

### Returns:

    {
      "type": "youtube",
      "url":"http://www.youtube.com/watch?v=1iYElrdil-M",
      "title": "Save The Arts: An Important Message About the Arts by David Shrigley - YouTube",
      "description": "David Shrigley's brilliant new video as part of Save The Arts, a new campaign by more than 100 leading UK artists urging the government not to cut arts fundi...",
      "id": "1iYElrdil-M",
      "embed_code": "&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;http://www.youtube.com/embed/1iYElrdil-M&quot; frameborder=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;"
    }

Also supports JSONP given a callback param.

## Contribute

Adding a new 'type' requires adding a new class that inherits from UrlResource, then adding the class name to the types array in `get.rb` (before `UrlResource`). The `PATTERN` constant is used to match the url. See any class in the `url_resources` directory for an example.

## Acknowledgments

Thanks to [samoli](https://github.com/samoli) for getting me started with Sinatra/Ruby and for advice on structuring the project.

## Licence

(The MIT License)

Copyright © 2012 Dom Christie

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.