class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  hasBusted: ->
    console.log('the player has busted')

# every hit, player or dealer we need to evaluate score
# if the score is > 21
  # emit some sort of "has busted" event
# if the score is < 21
  # if it's the player
    # they can choose to hit again
    # they can choose to stand
