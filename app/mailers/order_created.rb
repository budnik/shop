class OrderCreated < ActionMailer::Base
  default from: "kompas.dp.ua@gmail.com"
  default to: "kompas.dp.ua@gmail.com"
  

  def notification(id)
    @order = Order.find(id)
    @products = Product.find(@order.product_ids)
    mail subject: 'order received'
  end
end
