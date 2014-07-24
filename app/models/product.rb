class Product < ActiveRecord::Base
  belongs_to :price
  validates_presence_of :name
  validates_presence_of :category
  validates_presence_of :code
  validate :prices_presence

  %i[retail_price wholesale dealer_price partner_price].each_with_index do |name, i|
    define_method("#{name}=") do |price|
      self[:prices] ||= []
      prices[i]=(price*100).to_i rescue nil
      prices_will_change!
    end
  end

  def prices_presence
    prices.count == 4 and prices.all?{|p| p > 0}
  end
end
