
class window.Player extends Backbone.Model
  initialize: =>
    @set 'chipCount', 1000
    @set 'bet', 0
    @set 'wins', 0
    @set 'losses', 0



