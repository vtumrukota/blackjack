class window.GameView extends Backbone.View
  className: 'game'

  tagName: 'game-container'

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="double-button">Double</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': ->
      #@model.get('playerHand').stand()
      @model.get('dealerHand').playToWin()
    'click .double-button': -> @model.get('playerHand').double()

  initialize: ->
   # @on 'change:game', => @render()
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


  busted: ->
    alert "GAME OVER"
#Creating buttons and event listeners and rendering Player/Dealer
