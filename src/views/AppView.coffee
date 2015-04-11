class window.AppView extends Backbone.View
  template: _.template '
    <div class="table-container"> <label>Table Minimum: 25</label></div>
    <button class="startGame-button">Start Game</button>
    <div class="player-container"></div>
    <div class="game-container"></div>
  '

  #events:
    #'click .startGame-button': -> @model.get('playerHand').hit()

  initialize: ->
    @listenTo @model, 'change', @render
    @render()

  render: ->
    console.log 'render in app'
    @$el.children().detach()
    @$el.html @template()
    # @$('.player-container').html new PlayerView(collection: @model.get 'player').el
    @$('.game-container').html new GameView(model: @model.get 'game').el


#Creating buttons and event listeners and rendering Player/Dealer
