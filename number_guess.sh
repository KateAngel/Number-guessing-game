#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# $($PSQL "CREATE DATABASE number_guess;")
# $($PSQL "CREATE TABLE users(user_id SERIAL PRIMARY KEY, username VARCHAR(22));")
# $($PSQL "ALTER TABLE users ADD UNIQUE(username);")
# $($PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY, number_to_guess INT NOT NULL, user_id INT NOT NULL, number_of_guesses INT);")
# $($PSQL "ALTER TABLE games ADD FOREIGN KEY(user_id) REFERENCES users(user_id);")

# title
echo -e "\n~~~  Number Guessing Game ~~~\n"

# prompt the user for a username
echo "Enter your username:"
read USERNAME
# look for username in database
USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
# if that username has not been used before
if [[ -z $USERNAME_RESULT ]]
then
# say hello only
echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
# get total number of games and the fewest number of guesses for that username from database
GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID;")
BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID;")

echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

START_NEW_GAME() {
  # get random number between 1 and 1000 to guess
  SECRET_NUMBER=$(( $RANDOM % 1000 + 1)); 
  # insert new game record
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(number_to_guess,user_id) VALUES($SECRET_NUMBER,$USER_ID);")
  GAME_ID=$($PSQL "SELECT MAX(game_id) FROM games;")
  COUNT_GUESSES=0
  # guess number
  GUESS
  COMPARE
}

GUESS() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nGuess the secret number between 1 and 1000:"
  fi
  read GUESSED_NUMBER
  (( COUNT_GUESSES++ ))
  # if input is not a number
    if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
    then
      # guess again
      GUESS "That is not an integer, guess again:"
    elif (( $GUESSED_NUMBER > 1000 )) || (( $GUESSED_NUMBER < 1 ))
    then
      # guess again
      GUESS "That is not in a range [1-1000], guess again:"
    fi
}

COMPARE() {
  # compare guessed number to the secret number of this game
  if [ $GUESSED_NUMBER -eq $SECRET_NUMBER ]
  then
    # =, you won
    NUMBER_OF_GUESSES_SET_INTO_DATABASE=$($PSQL "UPDATE games SET number_of_guesses=$COUNT_GUESSES WHERE game_id=$GAME_ID")
    echo -e "\nYou guessed it in $COUNT_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  elif (( $GUESSED_NUMBER > $SECRET_NUMBER ))
  then
    # if >, guess again
    GUESS "It's lower than that, guess again:"
    COMPARE
  elif (( $GUESSED_NUMBER < $SECRET_NUMBER ))
  then
    # if <, guess again
    GUESS "It's higher than that, guess again:"
    COMPARE
  fi
}


# start game
START_NEW_GAME

