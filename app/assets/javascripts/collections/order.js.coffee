class Shop.Collections.Order extends Backbone.Collection
  model: Shop.Models.Product
 
  initialize: ->
    new Shop.Views.OrdersIndex collection: @
    # this.on "add", -> $("#cart").addClass('visible')

  summ: ->
    summer = (memo, num)->
      memo + num.get('prices')[0]
    "$" + (0.01 * @reduce summer, 0)
