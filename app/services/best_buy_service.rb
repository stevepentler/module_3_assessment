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
    # response = client.get("products(longDescription=#{params})?show=sku,name&apiKey=#{ENV['API_KEY']}")
    response = client.get("products(longDescription=#{params})?show=sku,name&pageSize=15&page=5&apiKey=#{ENV['API_KEY']}")
    items = (response.body).to_json
    binding.pry
    JSON.parse(items)
  end
end

# longDescription=#{params})?show=sku,name,average,customerReviewAverage,&pageSize=15&page=5&