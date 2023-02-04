#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t -q --no-align -c"

EXIT() {
  #ACTUALITZA PARTIDES JUGADES
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
    (( GAMES_PLAYED += 1 ))
    $PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username='$USERNAME'"
  #ACTUALITZA MILLOR RESULTAT
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
    if [[ $BEST_GAME -eq 0 || $NOG -lt $BEST_GAME ]]
    then
      $PSQL "UPDATE users SET best_game=$NOG WHERE username='$USERNAME'"
    fi
  
  echo "You guessed it in $NOG tries. The secret number was $NUMBER. Nice job!"
}

START_GAME() {
  #Esull numero a l'atzar entre 1 i 1000
  NUMBER=$(($RANDOM % 1000 + 1))
  NOG=1
  echo "Guess the secret number between 1 and 1000: "
  read INPUT
  
    while [[ $INPUT -ne $NUMBER ]]
    do
      (( NOG += 1 ))
      if [[ ! $INPUT =~ ^[0-9]+$ ]]
      then
        echo "That is not an integer, guess again:"
      elif [[ $INPUT -gt $NUMBER ]]
      then 
        echo "It's lower than that, guess again:"
      elif [[ $INPUT -lt $NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      fi
      read INPUT
    done
    EXIT
}

SIGNUP() {
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  START_GAME
}

USER_INFO() {
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  echo "Welcome back, "$USERNAME"! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  START_GAME
}

CHECK_USER() {
  read USERNAME
  CHECK_USERNAME=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")
  if [[ -z $CHECK_USERNAME ]]
  then
    SIGNUP
  else
    USER_INFO
  fi
}

echo "Enter your username: "
CHECK_USER
