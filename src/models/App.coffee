# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # @on 'add' ->
    #   console.log('hit')
  evaluateScore:(hand) ->
    # @get ("dealerHand").first().flip()
    # console.log(hand.first().flip())
    # shown = false
    if hand is @get('dealerHand') and not hand.first().reavealed
      console.log('flipped over dealers first card')
      hand.first().flip()
      # shown = true

    currentScore = hand.minScore()
    console.log("evaluating hand, score = ", currentScore)
    if currentScore > 21
      hand.hasBusted()
    else if currentScore < 17 and hand is @get 'dealerHand'
      hand.hit()
      @.evaluateScore(hand)
    else if hand is @get 'dealerHand'
      console.log('dealer stands');
      hand.stand()


    # console.log(@get 'playerHand')

    #set up a listener that listens for an add event
      #on add fire an evaluateScore method

    #define evaluateScore method that takes current hand and checks to see if score > 21
     #if > 21, trigger a hasBusted event.
      #determine who triggered hasBusted
       #if dealer hasBusted, player wins
       #if player hasBusted, dealer wins, restart

