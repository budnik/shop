class OrderCreated < ActionMailer::Base
  default from: "kompas.dp.ua@gmail.com"
  default to: "kompas.dp.ua@gmail.com"
  

  def notification(id)
    mail subject: 'order received', body:id
  end
end
