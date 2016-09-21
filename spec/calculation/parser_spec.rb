require 'calculation'

describe Calculation::Parser do

  before(:each) do
    @parser = Calculation::Parser.new
  end

  it "1 + 2" do
    expression = @parser.parse("1 + 2")
    expect(expression.operator).to eq(:+)
    expect(expression.left).to eq(Calculation::Number.new(1))
    expect(expression.right).to eq(Calculation::Number.new(2))
  end

  it "2 * 4" do
    expression = @parser.parse("2 * 4")
    expect(expression.operator).to eq(:*)
    expect(expression.left).to eq(Calculation::Number.new(2))
    expect(expression.right).to eq(Calculation::Number.new(4))
  end

  it "4 + 2 * 8" do
    expression = @parser.parse("4 + 2 * 8")
    expect(expression.operator).to eq(:+)
    expect(expression.left).to eq(Calculation::Number.new(4))
    expect(expression.right.operator).to eq(:*)
    expect(expression.right.left).to eq(Calculation::Number.new(2))
    expect(expression.right.right).to eq(Calculation::Number.new(8))
  end

  it "(4 + 2) * 8" do
    expression = @parser.parse("(4 + 2) * 8")
    expect(expression.operator).to eq(:*)
    expect(expression.right).to eq(Calculation::Number.new(8))
    expect(expression.left.operator).to eq(:+)
    expect(expression.left.left).to eq(Calculation::Number.new(4))
    expect(expression.left.right).to eq(Calculation::Number.new(2))
  end

  it "6 * -3" do
    expression = @parser.parse("6 * -3")
    expect(expression.operator).to eq(:*)
    expect(expression.left).to eq(Calculation::Number.new(6))
    expect(expression.right).to eq(Calculation::Negation.new(Calculation::Number.new(3)))
  end

end
