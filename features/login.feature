@working_feature
Feature: Log in
	In order make additions or edits to the website
	As a member of the lab
	I want to log in
	
	Scenario: Go to Log In Page from home
		Given I am not logged in
		When I go to the homepage
		And I follow "Login"
		Then I should be on the login page
	
	Scenario: Go to login page from publications index
		Given I am on the publications page
		When I follow "Login"
		Then I should be on the login page