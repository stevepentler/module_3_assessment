class BestBuyService
  attr_reader :client,
              :params

  def initialize(params)
    @client = Faraday.new("http://api.bestbuy.com/v1/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    @params = params
  end

  def get_products
    response = client.get("products(longDescription=#{params}*)?show=sku,name,customerReviewAverage&pageSize=15&page=5&apiKey=nc676wsjs86rfzd62558j3cg&format=json")
    products = JSON.parse(response.body)["products"]
  end
end