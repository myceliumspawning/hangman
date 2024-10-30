require_relative 'lib/hangman'

print 'Shall we play a game of hangman? y/n:  '
answer = gets.chomp

while answer =! 'y'
  puts 'Why not? Come on, just type y to start: '
  answer = gets.chomp
end

Game.new