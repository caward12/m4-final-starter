require 'rails_helper'

describe "register user" do
  it "can edit a link"do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    link = user.links.create(url: "http://turing.io", title: "turing")

    login_user(user)

    click_on "Edit"

    expect(current_path).to eq(edit_link_path(link))

    fill_in "link[url]", with: "https://www.turing.io/alumni"
    fill_in "link[title]", with: "Turing Alums"
    click_on "Update"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Turing Alums")
    expect(page).to have_content("https://www.turing.io/alumni")
  end

  it "will not update if edit to an invalid url" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    link = user.links.create(url: "http://turing.io", title: "turing")

    login_user(user)

    click_on "Edit"

    expect(current_path).to eq(edit_link_path(link))

    fill_in "link[url]", with: "www.turing.io/alumni"
    fill_in "link[title]", with: "Turing Alums"
    click_on "Update"

    expect(page).to have_content("Url Not a Valid URL")
  end
end