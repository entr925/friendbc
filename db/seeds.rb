# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'


url = 'https://graph.facebook.com/me/home?limit=200&access_token=CAACEdEose0cBAHlDHzpMgWQHKESo9FdjScNMPIIH8YksLmXVDwNrSp1AfoqEZAm7SVMAPf3juqxbsdCkLlv3pQgfSZA38EfvrfECCWH0bqgfdKkAxtkbTDCU98D9XVQFr6z8gUIY9XY1X1DL8Tv2gWBbIKRbkZD'

result = open(url).read

home = JSON.parse(result)

posts = home["data"]

posts.each do |post|
  if post["type"] == "video"
    p = Post.new
    p.from = post["from"]["name"]
    p.message = post["message"]
    p.link = post["link"]
    p.facebook_id = post["id"]
    p.save
  end
end

puts "There are now #{Post.count} rows in the Posts table."








