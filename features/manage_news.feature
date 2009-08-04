@broken_feature
Feature: Manage News
	In order to manage news events
	As a member of the lab
	I want make sure the news/events page updates, etc. when I say so.
	
	Background:
		Given the following event records
		 | title        | body                                                       |
		 | New Event!!! | Could this get any more exciting!?! I submit it could NOT! |
		And I am logged in as "<login>" with password "secret"
		And I go to the news page

	
	Scenario Outline: Create Valid Event
	    And I have no events
	  	And I follow "New event"
	    And I fill in "Title" with "New Event!!!"
	    And I fill in "Body" with "Could this get any more exciting!?! I submit it could NOT!"
	    And I press "Create"
	    Then I should see "Event was successfully created."
	    And I should see "New Event!!!"
		And I should see "Could this get any more exciting!?! I submit it could NOT!"
	    And I should have 1 event
		
	Scenario Outline: Edit Event
	  	And I follow "edit"
	    And I fill in "Title" with "<title>"
	    And I fill in "Body" with "<body>"
	    And I press "Update"
	    Then I should see "Event was successfully updated."	
		And I should see "New Event!!!"
		And I should see "Could this get any more exciting!?! I submit it could NOT!"
	    And I should have 1 event