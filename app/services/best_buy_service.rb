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
    response = client.get(client.get("products(longDescription=#{params})?apiKey=#{ENV['API_KEY']}"))
    binding.pry
    items = JSON.parse(response.body)
  end
end

# longDescription=#{params})?show=sku,name,average,customerReviewAverage,&pageSize=15&page=5&