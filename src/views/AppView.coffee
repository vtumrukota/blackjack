class window.AppView extends Backbone.View
  template: _.template '
    <div class="table-container"> <label>Table Minimum: 25</label></div>
    <button class="startGame-button">Start Game</button>
    <div class="game-container"></div>
    <div class="player-container"></div>
  '

  events:
    'click .startGame-button': -> @renderGame()

  initialize: ->
    @listenTo @model, 'change', @render
    @model.get 'gameOver', @gameOver, @
    @render()

  render: ->
    console.log 'render in app'
    @$el.children().detach()
    @$el.html @template()

  renderGame: ->
    @$el.children().detach()
    @$el.html @template()
    # @$('.player-container').html new PlayerView(collection: @model.get 'player').el
    @model.startGame()
    @$('.game-container').html new GameView(model: @model.get 'game').el


  gameOver: ->
    console.log 'GAME OVER'
    @$el.children().detach()
    @$('.player-container').html '<div> Wins: <%= wins =></div> <div> Losses: <%= losses =></div>'

#Creating buttons and event listeners and rendering Player/Dealer
