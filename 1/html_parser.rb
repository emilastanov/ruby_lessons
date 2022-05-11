
require 'open-uri'
require 'nokogiri'
require 'json'


URL = 'https://en.wikipedia.org/wiki/List_of_tz_database_time_zones'

html = URI.open URL

document = Nokogiri::HTML html
table = document.search(:table)[0].search(:tr)
table = table.slice(2, table.length)

result = []

table.each do |row|
  columns = row.search(:td)
  utc = columns[4].search(:a)[0].content
  sign = utc.slice!(0)

  result.push(
    id: row[:id],
    description: columns[1].search(:a)[0][:title],
    country: columns[1].search(:a)[0].content,
    utc: {
      string: "UTC#{sign}#{utc}",
      minutes: "#{
        sign
      }#{
        utc.split(':')[0].to_i * 60 + utc.split(':')[1].to_i
      }",
      hours: "#{
        sign
      }#{
        utc.split(':')[0].to_i + utc.split(':')[1].to_i / 60.0
      }"
    }
  )
end



File::open("#{__dir__}/utc_dictionary.json", "w:UTF-8") do |t|
  t << JSON.pretty_generate(result)
end

