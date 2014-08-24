window.Shop =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Shop.Routers.Price
    Backbone.history.start pushState: true
    
$(document).ready ->
  Shop.initialize()
