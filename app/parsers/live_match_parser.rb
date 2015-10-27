class LiveMatchParser
  include SAXMachine

  attribute :alternate_id_2

  element :ht, value: :score
  element :ft, value: :score

  def ht_home_goal
    ht && ht.match(/(\d+)\D+\d+/) { $1 }
  end

  def ht_away_goal
    ht && ht.match(/\d+\D+(\d+)/) { $1 }
  end

  def ft_home_goal
    ft && ft.match(/(\d+)\D+\d+/) { $1 }
  end

  def ft_away_goal
    ft && ft.match(/\d+\D+(\d+)/) { $1 }
  end
end
