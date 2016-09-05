module CalculateSupport
  def percent_of(n)
    value = (self.to_f / n.to_f * 100.0).round(2)
    value.nan? ? 0 : value
  end

end