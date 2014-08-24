class Shop.Collections.Order extends Backbone.Collection
  model: Shop.Models.Product
 
  initialize: ->
    this.on "add", -> alert 'foo'