module Reconstitutable
  def save_game
    print "Would you like to save your game? y/n "
    answer = gets.chomp
    if answer == 'y'
      print "What would you like to name your file? "
      filename = gets.chomp
      save_to_file(filename)
      exit
    else
      return
    end
  end

  def save_to_file(filename)
    File.open(filename, 'wb') do |file|
      file.write(Marshal.dump(self))
    end
  end

  def load_game
    print "What is the name of your saved file? "
    filename = gets.chomp
    file = load_from_file(filename)
    load_data_from_object(file)
    play
  end

  def load_from_file(filename)
    File.open(filename, 'rb') do |file|
      Marshal.load(file)
    end
  end

  def load_data_from_object(other_object)
    @word = other_object.word
    @progress = other_object.progress
    @guess = other_object.guess
    @wrong_letters = other_object.wrong_letters
  end
end