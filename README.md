# Mastermind Game

A Ruby implementation of the classic Mastermind game, where players can play as either the code maker or code guesser against a computer opponent. This project is a part of The Odin Project.

## Features

- Play as the code maker or code guesser
- Computer AI for both roles
- Command-line interface

## Files

- `main.rb`: Entry point of the game
- `game.rb`: Main game logic
- `code_maker.rb`: Code maker class (human or computer)
- `code_guesser.rb`: Code guesser class (human or computer)

## How to Play

1. Clone the repository
2. Run `ruby main.rb` in the terminal
3. Follow the on-screen instructions

## Game Rules

- The code consists of 4 colors chosen from R (Red), G (Green), B (Blue), and Y (Yellow)
- The code guesser has 12 attempts to guess the correct code
- After each guess, feedback is given:
  - Red pegs: correct color and position
  - White pegs: correct color but wrong position

Enjoy playing Mastermind!