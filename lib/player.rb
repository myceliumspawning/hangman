class Player
  attr_reader :guess

  def initialize
    @guess = ask_player
  end

  private

  def ask_player
    # ask player for their input
    print "Choose a letter as your guess: "
    guess = gets.chomp
    # check that input is an alphabet (gets to lowercase)
    while guess =~ /[^A-Za-z]/
      print "That was not a letter. Choose a letter: "
      guess = gets.chomp
    end
    if guess =~ /[A-Za-z]/
      guess = guess.downcase
    end
  end
end