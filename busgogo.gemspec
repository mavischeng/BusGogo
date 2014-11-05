

Gem::Specification.new do |s|
  s.name        = 'busgogo'
  s.version     = '0.1.0'
  s.date        = '2014-10-24'
  s.add_runtime_dependency 'nokogiri', '>= 1.6.2' # v.1.6.2 has documented problem
  s.summary     = "BusGoGo"
  s.description = "We use Hsinzhu Bus Website because we often take hsinzhu bus to somewhere. Everytime we are heading for somewhere, we go to their website(http://www.hcbus.com.tw/) to get information about their service station, time, and route. Therefore, we think it will be convenience for us to use web scraper to get specific information we want."
  s.authors     = ["Mavis Cheng (Cheng SyunWei), Yen Wei ,Wu ChiaChun"]
  s.email       = 'wei.yen.0718@gmail.com'
  s.files       = ["lib/scraper.rb"]
  s.homepage    =
    'http://rubygems.org/gems/busgogo'
end
