require 'minitest/autorun'
require 'minitest/rg'
require './lib/Scraper.rb'
require 'nokogiri'

scmachine = WebScraper.new
url = 'http://www.hcbus.com.tw/big5/service.asp'
agent = Mechanize.new
page = agent.get(url)
form = agent.page.forms.first

describe 'Test Functions' do
  it 'web structure' do
    web_data = open('http://www.hcbus.com.tw')
    @data = Nokogiri.HTML(web_data)
    scmachine.getwebstructure('http://www.hcbus.com.tw').must_equal @data
  end

  it 'bussstation' do
    scmachine.busstation.must_equal "region 1 : 新竹地區\nregion 2 : 竹東地區\nregion 3 : 關西地區\nregion 4 : 桃園地區\nregion 5 : 苗慄地區\nregion 6 : 國道班車資訊\nregion 7 : 一般公路資訊\nregion 8 : 新竹市區公車\nregion 9 : 桃園縣市區公車資訊\nregion 10 : 免費公車資訊\n"
  end

  it 'selection' do
    scmachine.selectdropdown(1)
    form.field_with(:name => 'jumpMenu').options[1].click
    page2 = form.submit
    @page.must_equal page2
  end
end
