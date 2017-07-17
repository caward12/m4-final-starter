require "rails_helper"

RSpec.describe "can mark links as unread", :js => :true do
  scenario "Mark a link as unread" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    user.links.create(url:"https://turing.io", title:"Turing")
    login_user(user)
    visit "/"
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

    within('.link') do
      expect(page).to have_link("Mark as Unread")
    end

    click_on "Mark as Unread"

    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    within('.link') do
      expect(page).to have_link("Mark as Read")
    end

  end
end