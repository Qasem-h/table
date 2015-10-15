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
    $newGame.find('.odds').html($(this).html())

    if $(this).data('home')
      $newGame.find('input.home').val(team)
    else if $(this).data('away')
      $newGame.find('input.away').val(team)

    $newGame.find('input.bet').val($(this).html())
    $newGame.find('input.match-id').val($(this).data('id'))

  $(document).on 'click', '.remove-game', (e) ->
    e.preventDefault()

    $(this).closest('.game').remove()
