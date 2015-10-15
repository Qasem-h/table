$ ->
  $(document).on 'click', '.make-bet', (e) ->
    e.preventDefault()

    $('.add-new-game').click()
    $('.new-game').appendTo('.games-container')

    $match = $(this).closest('.match')
    $newGame = $('.new-game').removeClass('new-game')
    team = $(this).data('home') || $(this).data('away') || 'draw'
    matchName = "#{$match.find('.match-name').html()} | #{team} @ #{$(this).html()}"

    $newGame.find('.match-name').html(matchName)