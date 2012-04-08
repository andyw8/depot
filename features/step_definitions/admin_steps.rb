Then /^I should be prompted to sign in$/ do
  @page.should have_login_form
end

When /^I visit the seller admin$/ do
  @page = Pages::Admin::Index.new
end

When /^I login with valid credentials$/ do
  sign_in_to_seller_admin
end

Then /^I should be welcomed$/ do
  @page.welcomed?.should be_true
end

When /^I login with invalid credentials$/ do
  user = FactoryGirl.create(:user)
  @page = Pages::Admin::Index.new
  @page.sign_in user.name, 'invalid'
end

Then /^I should be denied access$/ do
  @page.denied_access?.should be_true
end

def sign_in_to_seller_admin
  @user = FactoryGirl.create(:user)
  @page = Pages::Admin::Index.new
  @page.sign_in @user.name, @user.password
end
