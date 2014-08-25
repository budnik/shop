class Shop.Views.OrdersIndex extends Backbone.View
  el: $('#cart')
  template: JST['cart/index']

  initialize: ->
    @listenTo @collection, 'add', @render 

  render: ->
    @$el.html @template @collection
    @$el.addClass 'visible'
    @
