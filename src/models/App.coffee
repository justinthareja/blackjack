# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # @on 'add' ->
    #   console.log('hit')
  evaluateScore: ->
    console.log("evaluating player's hand")
    playerScore = @.get('playerHand').minScore()
    #if score > 21 trigger hasBusted event
    if playerScore > 21 then @.get('playerHand').hasBusted()

    # console.log(@get 'playerHand')

    #set up a listener that listens for an add event
      #on add fire an evaluateScore method

    #define evaluateScore method that takes current hand and checks to see if score > 21
     #if > 21, trigger a hasBusted event.
      #determine who triggered hasBusted
       #if dealer hasBusted, player wins
       #if player hasBusted, dealer wins, restart

