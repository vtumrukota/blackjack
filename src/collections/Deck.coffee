class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: ->
    playerhand = new Hand [@pop(), @pop()], @
    @blackjack(playerhand)
    playerhand

  dealDealer: ->
    dealerhand = new Hand [@pop().flip(), @pop()], @, true
    @blackjack(dealerhand)
    dealerhand

  blackjack: (hand) ->
    console.log "Ran Blackjack Test"
    if hand.scores()[1] is 21
      @trigger 'blackjack', @



#Initializing the Deck and dealing hand to player + dealer
