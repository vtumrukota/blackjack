class window.Game extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'isPlayerTurn', true
    @get ('playerHand')
      .on 'bust', => @trigger('bust')


  bust: ->
    @trigger('bust', @)








  # event that listen for hand busted. on changed 12
