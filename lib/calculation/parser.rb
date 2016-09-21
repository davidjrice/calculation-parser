require 'strscan'
require 'calculation/expression'
require 'calculation/term'
require 'calculation/negation'
require 'calculation/number'

# expression = term expr-op ;
# expr-op    = '+' expression
#            | '-' expression
#            | () ;
#
# term    = factor term-op ;
# term-op = '\*' term
#         | '/' term
#         | () ;
#
# factor = integer
#        | '(' expression ')'
#        | '-' factor ;
#
# integer = '0' | '1' | '2' | '3' | '4'
#         | '5' | '6' | '7' | '8' | '9' ;

module Calculation

  class Parser

    def parse(string)
      string.gsub!(/\s+/, '')
      scanner = StringScanner.new(string)
      parse_expression(scanner)
    end

    def parse_expression(scanner)
      left = parse_term(scanner)
      operator = scanner.scan(/\+|-/i)
      if operator
        Expression.new(operator.to_sym, left, parse_expression(scanner))
      else
        left
      end
    end

    def parse_term(scanner)
      left = parse_factor(scanner)
      operator = scanner.scan(/\*|\//i)
      if operator
        Term.new(operator.to_sym, left, parse_term(scanner))
      else
        left
      end
    end

    def parse_factor(scanner)
      start = scanner.pos
      negation = scanner.scan(/-/i)
      if scanner.skip(/\(/)
        if negation
          Negation.new(parse_expression(scanner)).tap do
            scanner.scan(/\)/) or
            raise "expression not terminated (start at #{start})"
          end
        else
          parse_expression(scanner).tap do
            scanner.scan(/\)/) or
            raise "expression not terminated (start at #{start})"
          end
        end
      else
        value = scanner.scan(/\d+/).to_i
        if negation
          Negation.new(Number.new(value))
        else
          Number.new(value)
        end
      end
    end

  end

end
