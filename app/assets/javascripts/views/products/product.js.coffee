class Shop.Views.Product extends Backbone.View
  events:
    'click .btn': 'addToCart'

  addToCart: ()->
    window.order.add @model
    debugger
