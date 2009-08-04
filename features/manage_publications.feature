@working_feature
Feature: Manage Publications
	In order to manage publications
	As a member of the lab
	I want make sure the publications page updates, etc. when I say so.
	
	Background: 
		Given the following publication records
		 | title                       | authors_info         |
		 | Super Awesome Science Paper | Kris & Erik          |
		 | Not So Super Awesome Paper  | Some Other Lab et al |

	Scenario Outline: Go to individual publication show page from publications index
		Given I am on the publications page
		When I follow "<title>"
		Then I should <action1>
		And I should <action2>
		
		Examples:
		 | title                       | action1                           | action2                        |
		 | Super Awesome Science Paper | see "Super Awesome Science Paper" | see "Kris & Erik"              |
		 | Super Awesome Science Paper | see "Not So Super Awesome Paper"  | not see "Some Other Lab et al" |
		 | Not So Super Awesome Paper  | see "Not So Super Awesome Paper"  | see "Some Other Lab et al"     |
		 | Not So Super Awesome Paper  | see "Super Awesome Science Paper" | not see "Kris & Erik"          |
# For the second and forth examples we expect to see the title in the sidebar, but the author info not showing up indicates that it actually IS on the sidebar and not the main content or still on the publication main page.
	

	Scenario Outline: Create Valid Publication
		Given I am logged in as "<login>" with password "secret"  
	    And I have no publications
	    And I am on the publications page
	    When I follow "New publication"
	    And I fill in "Title" with "New Publication!!!"
	    And I fill in "Journal info" with "A really good one"
	    And I fill in "Authors info" with "You, me, the other guy that works here"
	    And I fill in "Abstract" with "Read it!"
	    And I fill in "Pmid" with "123456"
	    And I press "Create"
	    Then I should see "Publication was successfully created."
	    And I should see "New Publication!!!"
	    And I should see "A really good"
	    And I should see "You, me, the other guy that works here"
	    And I should see "Read it!"
	    And I should see "123456"
	    And I should have 1 publication