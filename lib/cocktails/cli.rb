class Cocktails::CLI

  def call
    start
  end

  def list_cocktails
    puts "The most popular cocktails in the world are:"
    Cocktails::Drink.save_drinks
    Cocktails::Drink.all.each do |drink|
    puts "#{drink.name}"
    end
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
        drink = Cocktails::Drink.find(input)
        puts "#{drink.name}"
        puts '----------'
        puts "#{drink.description}"


      end
    end
    puts "Goodbye!"
  end
end
