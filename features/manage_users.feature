@broken_feature
Feature: Manage Users
	In order to manage users
	As a security enthusiast
	I want to edit profiles only when authorized
	
	Background: 
		Given the following user record
		 | login | password |
		 | admin | secret   |
	
	Scenario Outline: Show edit link as admin
		Given I am logged in as "<login>" with password "<password>"
		When I go to the publications page
		Then I should <action>

		Examples:
		 | login | password | action                    |
		 | admin | secret   | see "New publication"     |
		 | admin | badpass  | not see "New publication" |
		 |       |          | not see "New publication" |