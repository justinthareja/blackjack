# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('dealerHand').on 'dealerStands', @printWinner, @

  evaluateScore:(hand) ->
    # flips over dealer's first card
    if hand is @get('dealerHand') and not hand.first().get('revealed')
      hand.first().flip()

    currentScore = hand.minScore()

    if currentScore > 21
      hand.hasBusted()
    else if currentScore < 17 and hand is @get 'dealerHand'
      hand.hit()
      @.evaluateScore(hand)
    else if hand is @get 'dealerHand'
      hand.stand()

  printWinner: ->
    playerScore = @get('playerHand').minScore()
    dealerScore = @get('dealerHand').minScore()

    if dealerScore > playerScore or dealerScore is 21
      alert('Dealer wins with a ' + dealerScore)
    else if dealerScore < playerScore
      alert('Dealer drew ' + dealerScore + ". You Win!")
    else
      alert('Push')

    $('div').empty()
    new AppView(model: new App()).$el.appendTo 'body'


