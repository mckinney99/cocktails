class Cocktails::Drink

  attr_accessor :name, :description

  @@drinks_array = []

  def initialize(name, description)
  	@name = name
  	@description = description
  end

  def self.all
    @@drinks_array.reverse ||= self.save_drinks
  end

  def self.find(id)
  	@@drinks_array.reverse[id.to_i-1]
  end

  def self.save_drinks
  	doc = Nokogiri::HTML(open('https://vinepair.com/articles/50-most-popular-cocktails-world-2017/'))
    doc.css("body.category-wine-blog article h3").each do |node|
      name = node.text
      description = node.next.next.text
      if description == ""
        description = node.next.next.next.next.text
      end
     @@drinks_array << self.new(name, description)
    end
  end
end

 
 