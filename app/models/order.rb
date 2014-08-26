class Order < ActiveRecord::Base
  belongs_to :price
  after_create :send_email

  private
  def send_email
    OrderSender.perform_async id
  end
end
