module PSN
  BASE_URL = "https://store.sonyentertainmentnetwork.com/store/api/chihiro/00_09_000/"
  LOCALE = "ES/es"

  Search = Struct.new(:keywords) do
    def to_json
      JSON.parse(response)
    end

    private

    def url
      BASE_URL + "search/#{LOCALE}/999/#{keywords}?bucket=games&platform=vita"
    end

    def response
      @response ||= Net::HTTP.get(URI(url))
    end
  end

  Product = Struct.new(:id) do
    def to_json
      JSON.parse(response)
    end

    private

    def url
      BASE_URL + "container/#{LOCALE}/999/#{id}/"
    end

    def response
      @response ||= Net::HTTP.get(URI(url))
    end
  end
end
