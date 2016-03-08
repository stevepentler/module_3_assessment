class BestBuyService
  attr_reader :client,
              :params

  def initialize(params)
    @client = Faraday.new("https://api.bestbuy.com/v1/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    @params = params
  end

  def get_products
    client.get("products/longDescription=#{params})?show=sku,name,average,customerReviewAverage,&pageSize=15&page=5&apiKey=YourAPIKey&format=json")
  end
end