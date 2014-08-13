class OrderSender
  include Sidekiq::Worker
  
  def perform(id)
    OrderMailer.notification(id).deliver
  end
end
