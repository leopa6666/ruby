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
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5023420/ 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5023480/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5023633/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5023822/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5023991/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5024145/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5024232/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5024526/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5024533/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5024709/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5024868/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5024912/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5024984/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5025063/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5025130/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5025287/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5025411/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5025522/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5025662/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5025748/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5025897/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5026170/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5026186/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5026291/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5026451/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5026658/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5026677/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5026755/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5026835/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027053/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027276/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027361/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027440/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027520/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027612/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027721/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027800/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027876/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5027974/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5028061/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5028165/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5028253/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5028491/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5028557/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5028652/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5028747/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5028838/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5028986/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5029064/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5029140/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5029395/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5029541/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5029621/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5029717/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5029823/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030029/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030117/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030215/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030306/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030402/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030458/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030661/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030745/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030860/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030959/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5030959/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5031038/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5031105/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5031160/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5031351/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5031471/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5031558/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5031748/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5031814/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5031944/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032023/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032107/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032169/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032211/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032464/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032567/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032692/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032758/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032852/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5032938/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5033032/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5033105/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5033208/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5033841/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5033883/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5033979/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5034083/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5034171/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5034252/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5034352/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5034407/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5034514/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5034749/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5034930/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5035193/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5035369/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5035581/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5035607/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5035697/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5035806/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5035893/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5035995/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5036089/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5036151/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5036205/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5036288/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5036361/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5036461/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5036542/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5036843/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5036931/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5037017/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5037109/	 
      https://mbp-japan.com/ishikawa/izumigaokakaikei/column/5037195/ 
    )
      
    charset = nil

    # CSVヘッダー
    headers = ['title','Body', 'Page URL']
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
        titletext = ''
        doc.xpath('//div[@class="frame_pro_contents_inner"]').each do |node|
          titletext << node.css('h1').inner_text
          #p node.css('p').inner_text
        end 
        doc.xpath('//div[@class="bodytext"]').each do |node|
          csv << [titletext,node.css('p').inner_text, url]
          #p node.css('p').inner_text
        end 
        sleep(6)
      end
    end
    send_data(csv_data, filename: "posts.csv")
  end

end
