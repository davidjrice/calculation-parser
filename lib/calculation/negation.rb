module Calculation

  class Negation < Struct.new(:value)

    def solve
      -value.solve
    end

  end

end
