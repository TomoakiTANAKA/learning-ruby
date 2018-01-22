# QiitaのAPIを利用して、指定したタグの記事をcsvに吐き出すスクリプト
# APIの返り値 : 
# 利用制限 : https://qiita.com/api/v2/docs#%E5%88%A9%E7%94%A8%E5%88%B6%E9%99%90

require 'net/http'
require 'uri'
require 'json'

TAG_ID = 'rspec'.freeze
MAX_PAGE_SIZE = 10.freeze
FETCH_PER_PAGE = 100.freeze

csv_file_name = "#{File.basename(__FILE__, '.rb')}.csv"

qiita_posts = []
(1..MAX_PAGE_SIZE).each do |page|
    url = "https://qiita.com/api/v2/tags/#{TAG_ID}/items?page=#{page}&per_page=#{FETCH_PER_PAGE}"
    uri = URI.parse(url)
    res = Net::HTTP.get_response(uri)
    
    hash = JSON.parse(res.body)
    hash.each do |h|
        qiita_posts << {
            title: h["title"],
            updated_at: h["updated_at"],
            url: h["url"],
            likes_count: h["likes_count"],
            reactions_count: h["reactions_count"],
        }
    end
end

File.open(csv_file_name, mode = "w") do |f|
    f.write("title, likes_count, reactions_count, url, updated_at\n")
    qiita_posts.each do |post|
        f.write("#{post[:title].gsub(',', '')}, #{post[:likes_count]}, #{post[:reactions_count]}, #{post[:url]}, #{post[:updated_at]}\n")
    end
end
