# coding: utf-8
class TopController < ApplicationController

  require 'nokogiri'
  require 'open-uri'
  require 'csv'


  
  @testname = 'aaa'
  def index

    respond_to do |format|
      format.html
      format.csv do |csv|
        testbtn()
      end
    end
  end

  def testbtn
    #url = '  https://qiita.com/search?q=ruby'
    #url = 'https://leopa.hatenablog.jp/'
    urls = %w(
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5023137/
    )
      
    charset = nil

    # CSVヘッダー
    headers = ['Body', 'Page URL']
    user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
    csv_data = CSV.generate do |csv|

      urls.each  do |url|
        
        html = open(url ,'User-Agent' => user_agent) do |f|
          charset = f.charset
          f.read
        end

        p url

        doc = Nokogiri::HTML.parse(html, nil, charset)
        # 一行目はCSVヘッダーにする
        csv << headers

        doc.xpath('//div[@class="frame_pro_contents_inner"]').each do |node|
          csv << [node.css('h1').inner_text, url]
          #p node.css('p').inner_text
        end 
        doc.xpath('//div[@class="bodytext"]').each do |node|
          csv << [node.css('p').inner_text, url]
          #p node.css('p').inner_text
        end 
        sleep(6)
      end
    end
    send_data(csv_data, filename: "posts.csv")
  end

end
