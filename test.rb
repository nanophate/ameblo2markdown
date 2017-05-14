require 'open-uri'
require 'nokogiri'

url = "http://ameblo.jp/:user_name/entrylist.html"

charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
