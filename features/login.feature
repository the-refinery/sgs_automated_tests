Feature: Login

Scenario: Correct login credentials should work
  Given I am not logged in
  When I enter username "sgs@example.com"
  And I enter password "supersecret"
  Then I should see the notification "Signed in successfully."
  
Scenario: Correct email and incorrect password should not work
  Given I am not logged in
  When I enter username "sgs@example.com"
  And I enter password "incorrect"
  Then I should see the notification "Invalid email or password."
  
Scenario: Incorrect email and correct password should not work
  Given I am not logged in
  When I enter username "incorrect@example.com"
  And I enter password "supersecret"
  Then I should see the notification "Invalid email or password."
  
Scenario: Icorrect email and incorrect password should not work
  Given I am not logged in
  When I enter username "incorrect@example.com"
  And I enter password "incorrect"
  Then I should see the notification "Invalid email or password."
  
Scenario: I am logged in
  Given I am logged in