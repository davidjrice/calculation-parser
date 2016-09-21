module Calculation

  class Expression < Struct.new(:operator, :left, :right)

    def solve
      left.solve.send(operator, right.solve)
    end

  end

end
