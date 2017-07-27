require 'rails_helper'

describe "hot reads service" do
  it "can find urls for hot links" do
    VCR.use_cassette("hot_reads") do
      urls = HotReadsService.hot_links

      expect(urls).to be_an(Array)
      expect(urls.first).to be_a(String)
      expect(urls.first).to eq("https://www.target.com/")
    end
  end
end