require 'rails_helper'

describe "hot reads service", :type => :feature do
  it "can find urls for hot links" do
      urls = HotReadsService.hot_links

      expect(urls).to be_an(Array)
      expect(urls.first).to be_a(String)
  end
end