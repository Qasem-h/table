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

    $('.create-betslip').removeClass('hidden')

  $(document).on 'click', '.remove-game', (e) ->
    e.preventDefault()

    $(this).closest('.game').remove()
    calculateWinnings()

    $('.create-betslip').addClass('hidden') unless $('.game').length

  $(document).on 'change keyup', '.stake', (e) ->
    calculateWinnings()

  calculateWinnings = ->
    stakes = 0
    odds = 1
    $.each $('.game'), (index, game) ->
      odds *= parseFloat($(game).find('.odds').html())
      stakes += parseFloat($(game).find('.stake').val())

    winnings = odds * stakes
    $betslipSummary = $('.betslip-summary')
    $betslipSummary.find('.stake').html(stakes.toFixed(2))
    $betslipSummary.find('.odds').html(odds.toFixed(2))
    $betslipSummary.find('.winnings').html("£#{winnings.toFixed(2)}")
    $('.betslip-winnings').val(winnings.toFixed(2))
