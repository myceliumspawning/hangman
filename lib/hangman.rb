require_relative 'computer'
require_relative 'player'
require_relative 'save'

class Game
  include Reconstitutable
  
  attr_reader :word, :progress, :guess, :wrong_letters

  def initialize(word = [], progress = [], guess = 0, wrong_letters = [], win = false)
    choice
    @word = word
    @progress = progress
    @guess = guess
    @wrong_letters = wrong_letters
    @win = win
  end

  private

  def choice
    print "Would you like to start a new game (s) or load an old one (l)? "
    choice = gets.chomp
    if choice == 's'
      start_new
    elsif choice == 'l'
      load_game
    else
      self.choice
    end
  end

  def start_new
    @word = Computer.new.computer_selection.split('')
    @progress = @word.dup
    print_display
    @wrong_letters = []
    @guess = Player.new.guess
    play
  end

  def play
    loop do
    update_display
    check_win
    break if @win == true
    save_game
    @guess = Player.new.guess     
    end
  end

  def check_win
    if @progress == @word
      @win = true
      puts "The player wins!"
    elsif @wrong_letters.length == 7
      @win = true
      puts "The computer wins!"
    end
  end

  def update_display
    letter_spaces = []
    if @word.include?(@guess) == true
      letter_spaces = @word.each_index.select { |index| @word[index] == @guess }
    else
      @wrong_letters << @guess
    end

    letter_spaces.each do |element|
      @progress[element] = @guess
    end

    puts "\n"
    puts @progress.join
    puts "Incorrect letters chosen: #{@wrong_letters}"
    puts "Incorrect guesses left: #{7 - @wrong_letters.length}"
    puts "\n"
  end

  def print_display
    puts "\n"
    puts "This is the word you have to guess:"

    @progress.map! do |element|
      element = '-'
    end

    puts @progress.join
    puts "\n"
  end
end
