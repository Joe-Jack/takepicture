require 'roo'


xlsx = Roo::Excelx.new("./test_roo.xlsx")

# puts xlsx.sheets
sheet = xlsx.sheet(0)
sheet.each(id: 'id', name: 'name') do |hash|
  puts hash.inspect
  puts hash
  
end