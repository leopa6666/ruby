# coding: utf-8
class TopController < ApplicationController

  require 'nokogiri'
  require 'open-uri'
  require 'csv'

  @testname = 'aaa'
  def index
    #url = 'https://qiita.com/search?q=ruby'
    url = 'https://leopa.hatenablog.jp/'
      
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

      doc.xpath('//div[@class="entry-content"]').each do |node|
        csv << [node.css('p').inner_text, url]
        p node.css('p').inner_text
      end 
    end
    send_data(csv_data, filename: "posts.csv")

    return index
  end

  def testbtn

  end

end
