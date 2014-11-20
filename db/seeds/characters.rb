require 'csv'

CSV_FILE = 'db/characters - freewords.csv'

Character.delete_all

table = CSV.table(CSV_FILE, encoding: 'UTF-8:UTF-8')
table.each do |row|
  chara = Character.new
  chara.character = row[:character]
  freewords = ""
  row.fields(1..11) #freeword1..10を取得
    .delete_if{|fw| fw == nil} #nilを削除
    .each do |fw|
      if(!freewords.empty?)
        freewords << ','
      end
      freewords << fw
  end
  chara.freewords = freewords
  chara.save
  puts chara.character, chara.freewords
end
