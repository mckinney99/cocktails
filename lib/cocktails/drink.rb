class Cocktails::Drink

  attr_accessor :name, :url, :info

  def self.list
  #should return a list of cocktails
  puts <<-DOC.gsub /^\s*/, ''
  1. Manhattan
  2. Margarita
  DOC

  drink_1 = self.new
  drink_1.name = "manhattan"
  drink_1.info = "the manhattan is a blah blah blah"
  drink_1.url = https://vinepair.com/articles/50-most-popular-cocktails-world-2017
end
end 
