@working_feature
Feature: Contact Us Form
	In order ask questions or provide comments and/or suggestions 
	As a guest to the website
	I want to have an easy way to contact the lab
	
	Scenario: Go to the Contact Us form
		Given I am on the homepage
		When I follow "Contact"
		Then I should be on the contact us form