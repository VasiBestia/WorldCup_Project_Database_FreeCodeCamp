#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.

EMPTY_TABLES=$($PSQL "TRUNCATE teams, games RESTART IDENTITY")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
   if [[ $YEAR != "year" ]]
  then
     INS_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT (name) DO NOTHING")
     INS_OPP=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT (name) DO NOTHING")

    WINNER_ID=$($PSQL "Select team_id From teams where name='$WINNER'");
    OPPONENT_ID=$($PSQL "Select team_id From teams where name='$OPPONENT'");
    
    INSERT_DATA_TO_GAMES=$($PSQL "Insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) Values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)");

    if [[ $INSERT_DATA_TO_GAMES == "INSERT 0 1"  ]]
        then
        echo "Am inserat in tabela games meciul: $YEAR, $ROUND ($WINNER vs $OPPONENT)"
        fi
    fi
done

