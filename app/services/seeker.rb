class Seeker

  def self.find(query, page = 1, per_page = 20)
    return [] if query.nil? || query.empty?
    query = query.downcase.capitalize
    if page > 1
      previous_results = (page - 1) * per_page
      sql = "SELECT id, brand_name, generic_name, apis, price_cents, price_currency, COUNT(*) OVER() AS full_count FROM meds WHERE generic_name = '#{query}' OR brand_name = '#{query}' OR apis LIKE '%#{query}%' ORDER BY price_cents ASC LIMIT #{per_page} OFFSET #{previous_results};"
    else
      sql = "SELECT id, brand_name, generic_name, apis, price_cents, price_currency, COUNT(*) OVER() AS full_count FROM meds WHERE generic_name = '#{query}' OR brand_name = '#{query}' OR apis LIKE '%#{query}%' ORDER BY price_cents ASC LIMIT #{per_page};"
    end

    Med.find_by_sql(sql)
  end

  def self.decorate(results)
    return [].to_json if results.nil? || results.empty?
    decorated_results = { results: [], total_results: results.first.full_count }

    results.each do |result|
      hash = {}

      hash['id'] = result.id
      hash['brand_name'] = result.brand_name
      hash['generic_name'] = result.generic_name
      hash['apis'] = result.apis
      hash['price'] = format("%.2f", result.price.to_f)
      hash['currency_symbol'] = result.price.symbol.to_s

      decorated_results[:results] << hash
    end

    decorated_results.to_json
  end
end