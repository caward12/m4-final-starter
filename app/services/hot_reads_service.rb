class HotReadsService

  def self.hot_links
    response = Faraday.get("https://pacific-earth-63717.herokuapp.com/api/v1/links")
    JSON.parse(response.body).map do |link|
      link["url"]
    end
  end

end