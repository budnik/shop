class Shop.Views.Product extends Backbone.View
  events:
    'click .btn': 'addToCart'

  addToCart: ()->
    window.order.clone_add @model
