# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: =>
    #@set 'player', #new player("Vivek")
    @set 'minBet', 25
    @set 'game', game = new Game()
    @set 'isGameEnded', false
    @get ('game')
      .on 'bust', @startGame, @

  #events: =>

  startGame: ->
    console.log "Started New Game in AppModel"
    @set 'game', new Game()
    @set 'isGameEnded', true
    # @trigger 'newGame'

  endGame: ->
  # determines winners or loser
  # and affects players money.
#Dealer Logic and creating the game environment
