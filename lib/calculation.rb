require 'calculation/parser'

module Calculation

  class << self

    def solve(string)
      parser = Calculation::Parser.new
      expression = parser.parse(string)
      expression.solve
    end

  end
end
