#! /bin/bash
PSQL="psql -X --username=postgres --dbname=salon --no-align --tuples-only -c"


echo -e "\n~~~~~ MY SALON ~~~~~";

echo -e "\nWelcome to My Salon, how can I help you?\n";


MAIN_MENU(){
  if [[ $1 ]]
  then 
    echo -e "\n$1"
  fi
  
  SERVICES=$($PSQL "SELECT * FROM services");
  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
    do
      echo "$SERVICE_ID) $NAME"
    done    
    read SERVICE_ID_SELECTED;
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
      if [[ -z $SELECTED_SERVICE ]]      
        then
          MAIN_MENU "I could not find that service. What would you like today?"
      else
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        if [[ -z $CUSTOMER_ID ]]          
        then 
          echo -e "\nI don't have a record for that phone number, what's your name?";
          read CUSTOMER_NAME;
          INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        else 
          CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id='$CUSTOMER_ID'")
        fi
        echo -e "\nWhat time would you like your $SELECTED_SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME;
        INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id,service_id,time) VALUES ('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SELECTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."

          
        
      fi  
    fi
}
MAIN_MENU
