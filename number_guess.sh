#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=numberguess -t --no-align -c"
# GENERATE RANDOM NUMBER
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# GET USERNAME
echo "Enter your username: "
read USERNAME

# SEE IF USER EXISTS
USER_RESULT=$($PSQL "SELECT * FROM games WHERE username='$USERNAME'")

FIRST_TIME=0

if [[ -z $USER_RESULT ]]
then
  # USER DOES NOT EXIST
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # USER EXISTS
  FIRST_TIME=1
  echo $USER_RESULT | while IFS='|' read USERNAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo "Guess the secret number between 1 and 1000: "
read USER_GUESS

NUMBER_OF_GUESSES=1
# IF GUESS IS EQUAL
while (( $USER_GUESS != $SECRET_NUMBER))
do
  # CHECK IF GUESS IS A NUMBER
  if [[ $USER_GUESS =~ [0-9]+ ]]
  then
    if (($USER_GUESS < $SECRET_NUMBER))
    then
      echo "It's higher than that, guess again:"
      read USER_GUESS
    elif (($USER_GUESS > $SECRET_NUMBER))
    then
      echo "It's lower than that, guess again:"
      read USER_GUESS
    fi
    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
  else
    echo "That is not an integer, guess again:"
    read USER_GUESS
  fi
done

# UPDATE DATABSE
if (( $FIRST_TIME == 1 ))
then
  # NOT FIRST TIME
  UPDATE_GAMES_RESULT=$($PSQL "UPDATE games SET games_played=games_played+1, best_game=LEAST(best_game, $NUMBER_OF_GUESSES) WHERE username='$USERNAME';")
else
  # FIRST TIME
  UPDATE_GAMES_RESULT=$($PSQL "INSERT INTO games(username, games_played, best_game) VALUES('$USERNAME', 1, $NUMBER_OF_GUESSES);")
fi

# OUT OF THE LOOP, SO YOU WIN!
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
