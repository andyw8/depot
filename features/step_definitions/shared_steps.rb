Then /^the error message should be "([^"]*)"$/ do |message|
  @page.errors.should =~ [message]
end
