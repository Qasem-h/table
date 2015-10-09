class NullBookmaker
  def odds
    [null_odd, null_odd, null_odd]
  end
  
  private

  def null_odd
    NullOdd.new
  end
end
