# Hangman
This code implements the classic word-guessing game "Hangman" in Elixir.

The game is started by calling the start_game() function which chooses a random word from a predefined list of words, initializes the number of guesses made to 0, and starts the game loop by calling play_game() function.

The play_game() function is the main game loop that displays the current state of the word, the number of guesses left, and prompts the player to guess a letter. It then checks if the guess is correct or not and updates the state of the game accordingly. The loop continues until the game is over, which is determined by the number of wrong guesses made or if the word is correctly guessed.


The game state is managed by the word, guesses, and wrong_guesses variables. The display_word() function displays the current state of the word, with the correct letters guessed so far revealed and the remaining letters hidden by underscores. The masked_word() function returns the word with only the guessed letters shown.

The display_guesses_left() function displays the number of guesses left for the player. The game_over?() function checks if the game is over by comparing the number of wrong guesses made with the maximum allowed guesses or by checking if the word has been correctly guessed.

The display_result() function is called when the game is over and displays the final result of the game, either the word if the player lost or a congratulatory message if they won.

The get_guess() function prompts the player to enter a letter and validates the input, while the valid_guess?() function checks if the input is a single letter from A-Z.

Overall, this code provides a fully functional implementation of the Hangman game using Elixir programming language.
