@working_feature
Feature: Manage Users
	In order to manage users
	As a security enthusiast
	I want edits made only by authorized users
	
	Background: 
		Given the following user record
		 | login | password |
		 | admin | secret   |
	
	Scenario Outline: Show edit link as admin
		Given I am logged in as "<login>" with password "secret"
		When I go to the publications page
		Then I should <action>

		Examples:
		 | login | action                    |
		 | admin | see "New publication"     |
		 |       | not see "New publication" |