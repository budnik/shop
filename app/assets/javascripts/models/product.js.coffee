class Shop.Models.Product extends Backbone.Model
  initialize: ->
    new Shop.Views.Product
      el: $("#product_#{@id}"),
      model: @
