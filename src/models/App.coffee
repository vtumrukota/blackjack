# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: =>
    #@set 'player', #new player("Vivek")
    @set 'minBet', 25
    # @set 'game', game = null
    @set 'isGameEnded', false


  #events: =>

  startGame: ->
    @set 'game', new Game()
    @set 'isGameEnded', true
    # @trigger 'newGame'
    @get ('game')
      .on 'bustInGame', @endGame

  endGame: ->
    @trigger 'gameOver', @

    #Display and Adjust Win/Loss
    #Divy the Money
    #

#eliminate button functions


  # determines winners or loser
  # and affects players money.
#Dealer Logic and creating the game environment
