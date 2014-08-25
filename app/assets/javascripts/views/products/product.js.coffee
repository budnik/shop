class Shop.Views.Product extends Backbone.View
  events:
    'click .btn': 'addToCart'

  addToCart: ()->
    order_product = @model.toJSON()
    delete order_product.id
    window.order.add order_product
