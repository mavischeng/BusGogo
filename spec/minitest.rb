require 'minitest/autorun'
require 'minitest/rg'
require './lib/Scraper'

testmc = WebScraper.new
url = 'http://www.hcbus.com.tw'

describe 'Test Web Scraper' do
  it 'Test Stations' do
    testmc.busstation
    @station.must_equal 10
  end

    it 'Test Web Structure' do
    testmc.getwebstructure(url)
    web_data = open(url)
    @data.must_equal Nokogiri.HTML(web_data)
  end
end
