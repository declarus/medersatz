class Med < ApplicationRecord
  monetize :price_cents

  attr_accessor :currency_symbol

  def currency_symbol
    @currency_symbol ||= currency_symbol
  end
end
