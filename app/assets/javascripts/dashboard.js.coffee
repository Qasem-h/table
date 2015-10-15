$ ->
  $(document).on 'click', '.make-bet', (e) ->
    e.preventDefault()

    matchId = $(this).data('id')

    if $(".game[data-id=#{matchId}]").length
      $newGame = $(".game[data-id=#{matchId}]").first()
    else
      $('.add-new-game').click()
      $('.new-game').appendTo('.games-container')
      $newGame = $('.new-game').removeClass('new-game')
      $newGame.attr('data-id', matchId)

    $match = $(this).closest('.match')
    team = $(this).data('home') || $(this).data('away') || 'draw'
    matchName = "#{$match.find('.match-name').html()} | #{team} @ #{$(this).html()}"

    $newGame.find('.match-name').html(matchName)
    $newGame.find('.odds').html($(this).html())

    if $(this).data('home')
      $newGame.find('input.home').val(team)
    else if $(this).data('away')
      $newGame.find('input.away').val(team)

    $newGame.find('input.bet').val($(this).html())
    $newGame.find('input.match-id').val(matchId)

    calculateWinnings()
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

    if isNaN(winnings)
      $betslipSummary.find('.stake').html('')
      $betslipSummary.find('.odds').html(odds.toFixed(2))
      $betslipSummary.find('.winnings').html('')
      $('.betslip-winnings').val(0)
      $('.create-betslip').addClass('hidden')
    else
      $betslipSummary.find('.stake').html(stakes.toFixed(2))
      $betslipSummary.find('.odds').html(odds.toFixed(2))
      $betslipSummary.find('.winnings').html("£#{winnings.toFixed(2)}")
      $('.betslip-winnings').val(winnings.toFixed(2))
      $('.create-betslip').removeClass('hidden')
