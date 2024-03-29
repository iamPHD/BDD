Feature: Customer Transfer's Fund
     As a customer,
     I want to transfer funds
     so that I can send money to my friends and family
     
Scenario: Valid Payee
     Given the user is on Fund Transfer Page
     When he enters "Jim" as payee name
     And he enters "100" as amount
     And he Submits request for Fund Transfer
     Then ensure the fund transfer is complete with "$100 transferred successfully to Jim!!" message
     
Scenario: Invalid Payee
     Given the user is on Fund Transfer Page
     When he enters "Jack" as payee name
     And he enters "100" as amount
     And he Submits request for Fund Transfer
     Then ensure a transaction failure message "Transfer failed!! 'Jack' is not registered in your List of Payees" is displayed
     
Scenario: Account is overdrawn past the overdraft limit
     Given the user is on Fund Transfer Page
     When he enters "Tim" as payee name
     And he enters "1000000" as amount
     And he Submits request for Fund Transfer
     Then ensure a transaction failure message "Transfer failed!! account cannot be overdrawn" is displayed
     
Scenario: Blank Payee
     Given the user is on Fund Transfer Page
     When he enters "" as payee name
     And he enters "100" as amount
     And he Submits request for Fund Transfer
     Then ensure an edit message "Please enter a valid Payee name" is displayed

Scenario: Click on Transfer button without entering anything
     Given the user is on Fund Transfer Page
     And he Submits request for Fund Transfer
     Then ensure an edit message "Please enter a valid Payee name" is displayed
     
Scenario: Blank Amount
     Given the user is on Fund Transfer Page
     When he enters "Jim" as payee name
     And he enters "" as amount
     And he Submits request for Fund Transfer
     Then ensure an edit message "Please a valid amount" is displayed
     
Scenario: Alphanumeric Amount
     Given the user is on Fund Transfer Page
     When he enters "Jim" as payee name
     And he enters "4$5@3" as amount
     And he Submits request for Fund Transfer
     Then ensure an edit message "Please a valid amount" is displayed         