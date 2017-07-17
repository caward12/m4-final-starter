require 'rails_helper'

describe "links index", :js => :true do
  it "registered user can add new link with valid url" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")

    login_user(user)

    expect(page).to have_content("Add a New Link")

    fill_in "link[url]", with: "http://turing.io"
    fill_in "link[title]", with: "turing"
    click_on "Add Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("turing")
    expect(page).to have_content("http://turing.io")
    expect(page).to have_content("Read: false")
  end

  it "registered user cannot add invalide link url" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    login_user(user)

    fill_in "link[url]", with: "turing.io"
    fill_in "link[title]", with: "turing"
    click_on "Add Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Not a Valid URL")
  end
end