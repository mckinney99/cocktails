class Cocktails::CLI

  def call
    puts "Here are the top 50 most popular cocktails worldwide:"
    list_cocktails
    more_info
    goodbye
  end

  def list_cocktails
    puts "The most popular cocktails in the world are:"
    @drink = Cocktails::Drink.list
  end

  def more_info
    input = nil
    while input != "exit"
      puts "Enter the number of cocktail for more information, or type list for the list, or exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        puts @deals[input.to_i-1]
      elsif input == "list"
        list_cocktails
      else
        puts "Try Again! Type list, or exit."
      end
  end
end

  def goodbye
    puts "Goodbye!"
  end


end
