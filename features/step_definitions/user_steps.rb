Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |login, password|
  unless login.blank?
    visit login_url
    fill_in "Login", :with => login
    fill_in "Password", :with => password
    click_button "Log in"
  end
end
