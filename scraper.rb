require 'open-uri'
require 'nokogiri'
require 'rubygems'
require 'mechanize'
# Class that can be used to grab data from website(http://www.hcbus.com.tw/)
class WebScraper
  # @data stores information
  attr_accessor :data
  attr_accessor :station
  attr_accessor :page
  attr_accessor :output
#url='http://www.hcbus.com.tw/big5/service.asp'
  def initialize
    @data = data
    @station = station
    @page = page
    @output = output
  end

  def getwebstructure(website)
    web_data = open(website)
    @data = Nokogiri.HTML(web_data)
	 return @data 
  end

  def file_output
    selectstation
    File.write('Output.txt', @output)
    puts "\n\n\nPlease check data in Output.txt file"
  end

  def busstation
    url='http://www.hcbus.com.tw/big5/service.asp'
    num, @station = 1, {}
    getwebstructure(url)
    @data.css("select[name='jumpMenu'] option").each do |x|
    @station[num] = x.text  
    num+=1
    end
  return   @station
  end

def selectdropdown(url,num)
    tmpkey = [], tmpvalue = [], tmpkey2 = [] ,@page=[],title =[],content=[],content2=[]
    agent = Mechanize.new
    form = agent.get(url).forms.first
    form.field_with(name: 'jumpMenu').options[num].click
    @page  = form.submit  
    title = @page.parser.xpath("//table/tr[@class='text1_white']/td")
    content = @page.parser.xpath("//table/tr/td[@class='map-style']")
    content2 = @page.parser.xpath("//table/tr/td[@class='map-style'][1]")
    content2.each { |b| tmpkey2 << b.text.strip }
    title.each { |t| tmpkey << t.text.strip }
    content.each { |c| tmpvalue << c.text.strip }
    filehash(tmpkey, tmpvalue, tmpkey2)
  end
 def filehash(key, value, key2)
    value.each  do  |v|
      key2.each  do  |c|
        @output << '**************************************'  if v == c
      end
      @output << v
    end
    @output << '**************************************'  
  end
  def tmp_selectstation
    @output = []
    url = 'http://www.hcbus.com.tw/big5/service.asp'
    #busstation
    num, @station = 1, {}
    getwebstructure(url)
    @data.css("select[name='jumpMenu'] option").each do |x|
    @station[num] = x.text  
    num+=1
    end

    for i in 0..9
	 selectdropdown(url,i)
    end
     return @output
  end
  

end
