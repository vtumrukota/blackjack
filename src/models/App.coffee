# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    #@set 'player', #new player("Vivek")
    @set 'minBet', 25
    @set 'game', game = new Game()


  # listener that ends game

  events: =>
    @on 'bust', -> console.log 'that', @

  startGame: ->
    console.log "Started New Game in AppModel"
    @set 'game', new Game()

  endGame: ->
  # determines winners or loser
  # and affects players money.
#Dealer Logic and creating the game environment
