class Computer
  attr_reader :computer_selection

  def initialize
    @computer_selection = ask_computer
  end

  private

  def ask_computer
    # read words.txt file into an array using File.readlines('words.txt')
    contents = File.readlines('words.txt')
    # remove words that are <5 and >12 letters long
    contents.filter! { |word| word if word.length.between?(5, 12) }
    # .sample remaining words to return a random word
    word = contents.sample.chomp
    contents.delete(word+"\n")
    word
  end
end