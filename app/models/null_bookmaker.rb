class NullBookmaker
  def odds
    [null_odd, null_odd, null_odd]
  end

  def totals
    []
  end
  
  private

  def null_odd
    NullOdd.new
  end
end
