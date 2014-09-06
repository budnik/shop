class Shop.Views.Cart extends Backbone.View
  el: $('#cart')
  template: JST['cart/index']
  events:
    'click #purchase': 'sync'

  initialize: ->
    @listenTo @collection, 'add', @render

  render: ->
    @$el.html @template @collection
    @$el.addClass 'visible'
    @

  sync: ->
    @collection.sync()