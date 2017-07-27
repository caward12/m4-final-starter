class HotReadsService

  def self.hot_links
    response = Faraday.get("http://localhost:3001/api/v1/links")
    JSON.parse(response.body).map do |link|
      link["url"]
    end
  end

end