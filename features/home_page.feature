@working_feature
Feature: Home Page
	In order to learn about the lab
	As a member of the general public
	I want to see a rich, information-filled home page
	
	Background:
		Given the following event records
		 | title       | date       |
		 | event one   | 01-01-2009 |
		 | event two   | 01-02-2009 |
		 | event three | 01-03-2009 |
		And the following publication records
		 | title     | journal_info  |
		 | pub one   | journal one   |
		 | pub two   | journal two   |
		 | pub three | journal three |
		And the following user record
		 | login | password |
		 | admin | secret   |
			
	Scenario Outline: Visit the home page with some dynamic content
		Given I am logged in as "<login>" with password "<password>"
		When I go to the homepage
		Then I should see "event one"
		And I should see "event two"
		And I should see "event three"
		And I should see "pub one"
		And I should see "pub two"
		And I should see "pub three"
		And I should see "journal one"
		And I should see "journal two"
		And I should see "journal three"
		And I should <action> "create new blurb"
		And I should <action> "Manage"
		And I should see "<login_option>"
		
		Examples:
		 | login | password | action  | login_option |
		 | admin | secret   | see     | Logout       |
		 |       | secret   | not see | Login        |