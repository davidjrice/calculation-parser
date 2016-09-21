module Calculation

  class Expression < Struct.new(:operator, :left, :right)

    def solve
      eval("#{left.solve} #{operator} #{right.solve}")
    end

  end

end
