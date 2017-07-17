require 'rails_helper'

describe "register user" do
  it "can only see their own links"do
    user1 = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    user1.links.create(url: "http://turing.io", title: "turing")

    user2 = User.create(email: "turing@test.com", password: "abc", password_confirmation: "abc")
    user2.links.create(url: "http://www.google.com", title: "Google")

    login_user(user2)

    expect(page).to have_content("Google")
    expect(page).to have_content("http://www.google.com")
    expect(page).to_not have_content("turing")
  end
end