class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    #@set 'isBusted', false
    # @set 'isBusted', false

  hit: ->
   # if @isDealer
    # if score is over 21 then say no hit
    #if !@isBustedCalc()


      if !@isBustedCalc()
        @add(@deck.pop())
        if @isBustedCalc()
          @trigger 'bust', @


  isBustedCalc: ->
    if @scores().length is 1
      @scores()[0] > 21
    else
      @scores()[0] > 21 && @scores()[1] > 21

  stand: ->
    @trigger 'tallyScore', @
    # need to return scores[1] and switch to the dealer


    #@isDealer = true
    #if !@isDealer
      # change current user to dealer.
    #if @isDealer
      # tally score and determine winner
  playToWin: ->
    @first().flip()
    while(@scores()[0] <= 17)
      @add(@deck.pop())
      if !(@busted())
        @stand()

  busted: ->
    @scores()[0] > 21

  double: ->

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  maxScore: ->
    scores = @scores()
    if scores[1] <= 21 then scores[1] else scores[0]


  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


#Creating all the functionality for the player/dealer
