@working_feature
Feature: View People
	In order to manage users
	As a site user
	I want to view and edit people
	
	Background: 
		Given the following user records
		 | login | password |
		 | admin | secret   |
		And the following person records
		 | first_name | last_name | middle_initial  | group           |
		 | Sterling   | Johnson   | Johnson         | Scientists      |
		 | Amy        | Hawley    | C               | Research Staff  |
     | Ben        | Austin    | P.              | Collaborators   |
	
	Scenario: View a list of people
		When I go to the people page
		Then I should see "Sterling Johnson"
    And I should see "Amy Hawley"
    And I should see "Ben Austin"
    
  Scenario: View a person
    Given a person exists with first_name: "Jen", last_name: "Oh", group: "Research Staff"
    When I go to the show page for that person
    Then I should see "Jen Oh"