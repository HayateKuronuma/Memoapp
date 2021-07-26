require "csv"

puts "1.(新規でメモを作成)2.(既存のメモを編集する)"

memo_type = gets.chomp.to_s

if memo_type == "1"
  puts "拡張子を除いたファイルを入力してください"
  memo_name = gets.chomp.to_s
  puts "メモしたい内容を記入してください"
  puts "完了後、Ctrl + Dを押してください"
  memo_contents = $stdin.readlines
  CSV.open("#{memo_name}", "w") do |content|
    content << ["#{memo_contents}"]
  end
  puts "---------------"
  puts "メモを作成しました"
elsif memo_type == "2"
  puts "編集するファイル名を拡張子を除いて入力してください"
  memo_name = gets.chomp.to_s
  puts "編集内容を入力してください"
  puts "完了後、Ctrl + Dを押してください"
  memo_contents = $stdin.readlines
  CSV.open("#{memo_name}", "a") do |content|
    content << ["#{memo_contents}"]
  end
  puts "---------------"
  puts "メモを更新しました"
end