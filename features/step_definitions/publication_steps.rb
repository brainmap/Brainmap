# Given /^the following (.+)$/ do |factory, table|
#   table.hashes.each do |hash|
#     Factory(factory, hash)
#   end
# end

Given /^I have no publications$/ do
  Publication.delete_all
end

Then /^I should have ([0-9]+) publications?$/ do |count|
  Publication.count.should == count.to_i
end