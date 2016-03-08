class BestBuyService
  attr_reader :client,
              :params

  def initialize(params)
    @client = Faraday.new("https://api.bestbuy.com/v1") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    @params = params
  end

  def get_products
    response =client.get("/products(customerReviewAverage>=4&customerReviewCount>100)?show=customerReviewAverage,customerReviewCount,name,sku&format=json&apiKey=nc676wsjs86rfzd62558j3cg)
    items = JSON.parse(response.body)
    binding.pry
  end
end

# longDescription=#{params})?show=sku,name,average,customerReviewAverage,&pageSize=15&page=5&