require 'rails_helper'

describe "guest user" do
  it "is redirected to login page if not signed in" do
    visit root_path

    expect(current_path).to eq(login_path)
  end
end