<h1 align="center">TOP-Connect-Four - Readme</h1>
<p align="center">
  <strong>
    My solution for project from <a href="https://www.theodinproject.com" target="_blank">The Odin Project (TOP)</a> full-stack curriculum
  </strong>
</p>
<div align="center">
  <a href="https://www.theodinproject.com">
    <img src="_for_readme/banner.png">
  </a>
</div>

<br>

# Table of Contents
* [The Odin Project :thinking:](#the-odin-project-thinking)
  * [What is it](#what-is-it)
  * [Is it worth doing](#is-it-worth-doing)
* [Overview :sparkles:](#overview-sparkles)
  * [About](#about)
  * [Features](#features)
  * [Technologies](#technologies)
  * [Setup](#setup)
  * [Acknowledgements](#acknowledgements)
* [Details :scroll:](#details-scroll)
  * [User interface](#user-interface)

<br>

# The Odin Project :thinking:

## What is it  
[The Odin Project](https://www.theodinproject.com) is a free, open-source curriculum that teaches web development from the ground up. It covers HTML, CSS, JavaScript, Ruby, Git, React, and back-end technologies like Node.js and Ruby on Rails, offering a structured path from beginner to job-ready developer. The curriculum includes hands-on projects, coding exercises, and real-world applications to reinforce learning.

## Is it worth doing  
The Odin Project is an excellent resource for self-taught developers looking for a structured and comprehensive learning path. It encourages active learning through projects and collaboration with the community. However, since it requires self-discipline and problem-solving skills, those who prefer guided instruction with direct mentorship might find it challenging.

<br>

# Overview :sparkles:

## About
This project is my solution for [Project: Connect Four](https://www.theodinproject.com/lessons/ruby-connect-four) on [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) from [The Odin Project (TOP)](https://www.theodinproject.com) which is an open-source curriculum for learning full-stack web development. Project is created using Test-Driven Development (TDD) method.

<br>

![preview](/_for_readme/preview.png)

## Technologies
Languages:
- Ruby
  
Programs:
- [VSCode](https://code.visualstudio.com)
- [ShareX](https://getsharex.com)
- [GIMP](https://www.gimp.org)

## Features
### Project requirements
- ✅ 2-player command-line Connect Four game  
- ✅ Win with 4 in a row (horizontal, vertical, diagonal)  
- ✅ 7x6 grid with turn-based piece dropping  
- ✅ Prevent invalid moves and detect draw  
- ✅ Built using Test-Driven Development with RSpec  

### Additions
- Unicode symbols to enhance visual appearance
- Players can select their colors

## Setup
- Download this repository
- Open folder in terminal
- To run the game use `ruby ./lib/main.rb`
- To run the tests use:
  - `rspec` - all tests
  - `ruby ./spec/board_spec.rb` - tests for board class
  - `ruby ./spec/game_spec.rb` - tests for game class

## Acknowledgements
- [Emojipedia - circles unicode symbols](https://emojipedia.org/symbols)
- [AmpWhat - fullwidth unicode numbers](https://www.amp-what.com/unicode/search/fullwidth)

<br>

# Details :scroll:

## User interface

### Game start
After the game is run, both players must select their colors. If a player selects an invalid color, they will be prompted again until a valid one is provided. Players are allowed to choose the same color.  
![game start](/_for_readme/UI/game_start.png)

---

### Game
After selecting colors, players take turns dropping their pieces into the board. The game ends when one player gets four in a row — vertically, horizontally, or diagonally — and wins, or when the board is full, resulting in a draw.  
![game](/_for_readme/UI/game.png)

Players must input a number from 1 to 7. If the input is invalid, they will be prompted again until a correct value is entered.  
![wrong input](/_for_readme/UI/wrong_input.png)

