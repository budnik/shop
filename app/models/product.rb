class Product < ActiveRecord::Base
  belongs_to :price

  def retail_price=(price)
    self[:prices] ||= []
    prices[0]=price
  end

  def wholesale=(price)
    self[:prices] ||= []
    prices[1]=price
  end

  def dealer_price=(price)
    self[:prices] ||= []
    prices[2]=price
  end

  def partner_price=(price)
    self[:prices] ||= []
    prices[3]=price
  end
end
