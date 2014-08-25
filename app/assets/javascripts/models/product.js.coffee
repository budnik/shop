class Shop.Models.Product extends Backbone.Model
  initialize: ->
    if @collection instanceof Shop.Collections.Products
      new Shop.Views.Product model: @, el: $("#product_#{@id}")
