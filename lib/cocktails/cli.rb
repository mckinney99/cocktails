class Cocktails::CLI

  def call
    start
  end

  def list_cocktails
    @@all = []
    puts "The most popular cocktails in the world are:"
    doc = Nokogiri::HTML(open('https://vinepair.com/articles/50-most-popular-cocktails-world-2017/'))
    names = doc.css("body.category-wine-blog article h3").each do |node|
      hash = {}
      hash[:name] = node.text
      hash[:description] = node.next.next.text
      if hash[:description] == ""
        hash[:description] = node.next.next.next.next.text
      end
      @@all.unshift(hash)
    end
    @@all.each do |hash|
      puts hash[:name]
    end
  end

  def find_info(input)
    drink = @@all[input.to_i - 1]
    puts drink[:name]
    puts drink[:description]
  end

def start
  list_cocktails
  input = nil
  while input != "exit"
    puts ""
    puts "What drink would you like more information on, by number?"
    puts ""
    puts "Enter list to see the drinks again."
    puts "Enter exit to end the program."
    puts ""
    input = gets.strip
    if input == "list"
      list_cocktails
    elsif input.to_i > 0
      find_info(input)
      end
    end
    puts "Goodbye!"
  end
end
