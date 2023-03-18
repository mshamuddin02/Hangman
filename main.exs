defmodule Hangman do
  # Define the available words to be guessed
  @words ["banana", "apple", "cherry", "strawberry", "blueberry", "mango", "pineapple", "orange", "watermelon", "grape", "pear"]

  # Define the maximum number of guesses allowed
  @max_guesses 6

  # Define the starting state of the game
  def start_game do
    word = Enum.random(@words) # Choose a random word from the list
    guesses = ""
    play_game(word, guesses, 0) # Start the game with 0 wrong guesses
  end

  # Define the main game loop
  def play_game(word, guesses, wrong_guesses) do
    display_word(word, guesses)
    display_guesses_left(wrong_guesses)

  # Check if the game is over
  if game_over?(word, guesses, wrong_guesses) do
    display_result(word, wrong_guesses)
  else
    guess = get_guess()

    # Check if the guess is correct or not
    if correct_guess?(word, guess) do
      new_guesses = guesses <> guess
      if word == masked_word(word, new_guesses) |> String.replace(" ", "") do
        IO.puts("You guessed the word correctly!")
      end
      play_game(word, new_guesses, wrong_guesses)
    else
      new_wrong_guesses = wrong_guesses + 1
      play_game(word, guesses, new_wrong_guesses)
    end
  end
end


  # Display the current state of the word
  def display_word(word, guesses) when guesses == "" do
    display = for _c <- String.graphemes(word), do: "_"
    IO.puts(display |> Enum.join(" "))
  end

  def display_word(word, guesses) do
    display = for c <- String.graphemes(word) do
      if member?(c, String.graphemes(guesses)) do
        c
      else
        "_"
      end
    end
    IO.puts(display |> Enum.join(" "))
  end


  # Display the number of guesses left
  def display_guesses_left(wrong_guesses) do
    guesses_left = @max_guesses - wrong_guesses
    IO.puts("Guesses left: #{guesses_left}")
  end

  # Check if the game is over
  def game_over?(word, guesses, wrong_guesses) do
    wrong_guesses >= @max_guesses or word == masked_word(word, guesses)
  end

  # Display the final result of the game
  def display_result(word, wrong_guesses) do
    if wrong_guesses >= @max_guesses do
      IO.puts("You lost. The word was #{word}.")
    else
      IO.puts("Congratulations! You won!")
    end
  end

  # Check if the guess is correct
  def correct_guess?(word, guess) do
    String.contains?(word, guess)
  end

  # Prompt the player for a guess and validate it
  def get_guess do
    IO.puts("Guess a letter:")
    guess = IO.gets("") |> String.trim() |> String.downcase()

    if valid_guess?(guess) do
      guess
    else
      IO.puts("Invalid guess. Please enter a letter from A-Z.")
      get_guess()
    end
  end

  # Validate the guess
  def valid_guess?(guess) do
    String.length(guess) == 1 and String.match?(guess, ~r/[a-z]/)
  end

  # Check if an element is a member of a list
  def member?(elem, list) do
    Enum.member?(list, elem)
  end

  # Return the word with only the guessed letters shown
  def masked_word(word, guesses) do
    for c <- String.graphemes(word) do
      case member?(c, String.graphemes(guesses)) do
        true -> c
        false -> "_"
      end
    end |> Enum.join()
  end


end

Hangman.start_game()
