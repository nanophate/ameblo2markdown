# http://qiita.com/ya_s_u/items/c4f027df9be34fad8be5
# Made by @ya-s-u

require 'open-uri'
require 'nokogiri'

url = "http://ameblo.jp/:user_name/entrylist.html"

loop do
  # html取得
  charset = nil
  html = open(url) do |f|
    charset = f.charset
    f.read
  end

  # 記事一覧のhtmlパース
  doc = Nokogiri::HTML.parse(html, nil, charset)

  # 記事一覧
  doc.css('.contentTitleArea a').each do |node|
    get_entry_url = node.attribute('href').value

    d_html = open(get_entry_url) do |f|
      charset = f.charset
      f.read
    end

    # 記事のhtmlパース
    entry_doc = Nokogiri::HTML.parse(d_html, nil, charset)

    @entry_url = get_entry_url
    @article_title = entry_doc.css('.skinArticleHeader2').text.gsub(/\s+/, '')
    @article_time = entry_doc.css('.articleTime').text
    @article_text = entry_doc.css('.articleText').text

   # 記事のmarkdownを作成
    def ameblo_post_md
      <<~EOS
      ---
      title: #{@article_title}
      link:  #{@entry_url}
      time: #{@article_time}
      ---

      #{@article_text}
      EOS
    end

    File.open("posts/#{@article_title.gsub(/\//, '-')}.md", 'a' ) do |f|
      f.write (ameblo_post_md)
    end
  end

  # 次ページがなければ終了
  unless doc.css('.pagingNext').empty?
    url = doc.css('.pagingNext').attribute('href').value
    p '---------------------------------------------'
  else
    break
  end
end
