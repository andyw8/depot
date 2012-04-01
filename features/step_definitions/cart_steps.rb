Then /^I should not have a cart$/ do
  find('#cart').should_not be_visible
end
