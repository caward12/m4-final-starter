require 'rails_helper'

describe "filter links", :js => :true do
  it "can filter for unread links" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    user.links.create(url: "http://turing.io", title: "turing")
    user.links.create(url: "https://www.target.com/", title: "Target", read: true)
    user.links.create(url: "https://www.walmart.com/", title: "walmart" )

    login_user(user)

    click_on "Show Unread"

    expect(page).to have_content("turing")
    expect(page).to have_content("walmart")
    expect(page).to_not have_content("Target")
  end
end