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
      https://ma-japan.info/archives/15231	,
      https://ma-japan.info/archives/17580	,
      https://ma-japan.info/archives/17607	
    )
      
    charset = nil

    html = open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)


    # CSVヘッダー
    headers = ['Body', 'Page URL']

    csv_data = CSV.generate do |csv|
      # 一行目はCSVヘッダーにする
      csv << headers

      doc.xpath('//article[@id="post-single"]').each do |node|
        csv << [node.css('h1').inner_text, url]
        csv << [node.css('p').inner_text, url]
        #p node.css('p').inner_text
      end 
    end
    send_data(csv_data, filename: "posts.csv")
  end

end
