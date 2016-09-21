require 'calculation'

describe Calculation do

  it "1 + 2 = 3" do
    expect( Calculation.solve("1 + 2") ).to eq(3)
  end

  it "2 * 4 = 8" do
    expect( Calculation.solve("2 * 4") ).to eq(8)
  end

  it "4 + 2 * 8 = 20" do
    expect( Calculation.solve("4 + 2 * 8") ).to eq(20)
  end

  it "(4 + 2) * 8 = 48" do
    expect( Calculation.solve("(4 + 2) * 8") ).to eq(48)
  end

  it "((((5)+2)*2)-5)/3 = 3" do
    expect( Calculation.solve("((((5)+2)*2)-5)/3") ).to eq(3)
  end

  it "6 * -3 = -18" do
    expect( Calculation.solve("6 * -3") ).to eq(-18)
  end

  it "-(5 * 2) - 2 = -12" do
    expect( Calculation.solve("-(5 * 2) - 2") ).to eq(-12)
  end

end
