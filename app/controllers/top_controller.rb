# coding: utf-8
class TopController < ApplicationController

  require 'nokogiri'
  require 'open-uri'

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
    doc.xpath('//div[@class="entry-content"]').each do |node|
      p node.css('p').inner_text
    end 
  end

  def testbtn
    @testname = 'aaa'
  end

end
