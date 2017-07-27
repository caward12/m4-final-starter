require 'rails_helper'

RSpec.describe Link, type: :model do
  context "validations" do
    it 'is invalid without http' do
      user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
      link = user.links.new(title: 'title', url: 'google.com')

      expect(link).to be_invalid
    end

      it 'is valid with http' do
        user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
        link = user.links.new(title: 'title', url: 'http://www.google.com')

        expect(link).to be_valid
      end

    it 'validates presence of title' do
      user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
      link = user.links.new(url: 'http://www.google.com')

      expect(link).to be_invalid
    end
  end

  context "associations" do
    it {should belong_to :user}
  end

end