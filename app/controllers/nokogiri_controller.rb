# coding: utf-8
class NokogiriController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  
  def testsc

    url = 'https://qiita.com/search?q=ruby'
  
    charset = nil

    html = open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.xpath('//h1[@class="searchResult_itemTitle"]').each do |node|
      p node.css('a').inner_text
    end 

    return 'index'
  end

end
