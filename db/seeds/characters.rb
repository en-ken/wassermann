require 'csv'

CSV_FILE = 'db/characters_tmp.csv'

table = CSV.table(CSV_FILE, encoding: 'UTF-8:UTF-8')
table.each do |row|
  chara = Character.new
  chara.character = row[:character]
  keywords = ""
  row.fields(1..11) #keyword1..10を取得
    .delete_if{|kw| kw == nil} #nilを削除
    .each do |kw|
      keywords << ',' << kw
  end
  chara.keywords = keywords
  chara.save
  puts chara.character, chara.keywords
end
