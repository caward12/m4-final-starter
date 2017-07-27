require 'rails_helper'

describe "filter links", :js => :true do
  it "can filter for read links" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    user.links.create(url: "http://turing.io", title: "turing")
    user.links.create(url: "https://www.target.com/", title: "Target", read: true)
    user.links.create(url: "https://www.walmart.com/", title: "walmart" )

    fill_in "q", with: "t"

    expect(page).to have_content("turing")
    expect(page).to have_content("Target")
    expect(page).to have_content("walmart")

    fill_in "q", with: "ta"

    expect(page).to have_content("Target")
  end
end