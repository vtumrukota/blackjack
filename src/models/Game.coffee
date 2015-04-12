class window.Game extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'isPlayerTurn', true
    @get ('playerHand')
      .on('bust', @bust, @)
    # @get ('playerHand')
    #   .on('blackjack', -> alert "BLACKJACK!!!!")
    @get ('dealerHand')
      .on('bust', @bust, @)
    # @get ('dealerHand')
    #   .on('blackjack', -> alert "BLACKJACK!!!!")
    @get ('dealerHand')
      .on 'tallyScore', @determineWinner, @


  bust: ->
    console.log "BUST BROKE"
    console.log @
    @trigger 'bustInGame', @

  determineWinner: ->
    playerScore = @get('playerHand').maxScore()
    dealerScore = @get('dealerHand').maxScore()

    alert 'You Win!' unless playerScore > dealerScore
    alert 'You Lose!' unless playerScore < dealerScore
    alert 'Push' unless playerScore is dealerScore
    #Freeze functionality of other buttons once done
    #Wait for user to hit Start Game








  # event that listen for hand busted. on changed 12
