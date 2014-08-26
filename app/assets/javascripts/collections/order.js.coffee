class Shop.Collections.Order extends Backbone.Collection
  url: '/api/order'
  model: Shop.Models.Product
 
  initialize: ->
    new Shop.Views.OrdersIndex collection: @
    # this.on "add", -> $("#cart").addClass('visible')

  summ: ->
    summer = (memo, num)->
      memo + num.get('prices')[0]
    "$" + (0.01 * @reduce summer, 0)

  sync: ->
    $.post @url, @toJSON

  clone_add: (m)->
    product = m.toJSON()
    product.original_id = product.id
    delete product.id
    @add product
