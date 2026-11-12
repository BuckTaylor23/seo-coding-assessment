# frozen_string_literal: true

RSpec.describe DVLA::Wishy::Washy::Windows::CostCalculator do
  it 'charges £5 for the property plus £1 per window' do
    expect(described_class.cost_in_pounds(windows: 10)).to eq(15)
  end

  it 'charges only £5 when there are no windows' do
    expect(described_class.cost_in_pounds(windows: 0)).to eq(5)
  end
end
