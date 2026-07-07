#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Argüman kontrolü
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Argümanın sayı olup olmadığını kontrol et (atomic_number için)
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number = $1")
else
  # Eğer sayı değilse sembol veya isim araması yap
  ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1'")
fi

# Veritabanında bulunup bulunmadığını kontrol et
if [[ -z $ELEMENT_DATA ]]
then
  echo "I could not find that element in the database."
else
  # Çıktıyı parçala ve formatla
  echo "$ELEMENT_DATA" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
fi