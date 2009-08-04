Given /^I have no events$/ do
  Event.delete_all
end

Then /^I should have ([0-9]+) events?$/ do |count|
  Event.count.should == count.to_i
end