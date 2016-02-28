class Seeker

  def self.find(query, page = 1, per_page = 20)
    if page > 1
      previous_results = (page - 1) * per_page
      sql = "SELECT id, brand_name, generic_name, apis, price_cents FROM meds WHERE generic_name = '#{query}' OR brand_name = '#{query}' OR apis LIKE '%#{query}%' ORDER BY price_cents ASC LIMIT #{per_page} OFFSET #{previous_results};"
    else
      sql = "SELECT id, brand_name, generic_name, apis, price_cents FROM meds WHERE generic_name = '#{query}' OR brand_name = '#{query}' OR apis LIKE '%#{query}%' ORDER BY price_cents ASC LIMIT #{per_page};"
    end
    Med.find_by_sql(sql)
  end
end