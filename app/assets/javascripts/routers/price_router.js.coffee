class Shop.Routers.Price extends Backbone.Router
  initialize: (opts)->
    @route "prices/:id", "price", price

  price = (id)->
    window.order = new Shop.Collections.Order
    new Shop.Collections.Products window.products
