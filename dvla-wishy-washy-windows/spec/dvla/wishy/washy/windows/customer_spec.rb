# frozen_string_literal: true

RSpec.describe DVLA::Wishy::Washy::Windows::Customer do
  it 'creates a customer with valid details' do
    customer = described_class.new(customer_number: 1, name: 'John', windows: 10)

    expect(customer.customer_number).to eq(1)
    expect(customer.name).to eq('John')
    expect(customer.windows).to eq(10)
  end

  it 'allows a customer with zero windows' do
    customer = described_class.new(customer_number: 1, name: 'John', windows: 0)

    expect(customer.windows).to eq(0)
  end

  it 'rejects a customer number of zero' do
    expect { described_class.new(customer_number: 0, name: 'John', windows: 10) }
      .to raise_error(/Customer number must be a positive integer/)
  end

  it 'rejects a blank name' do
    expect { described_class.new(customer_number: 1, name: '', windows: 10) }
      .to raise_error(/Name must be a non-empty string/)
  end

  it 'rejects a negative number of windows' do
    expect { described_class.new(customer_number: 1, name: 'John', windows: -1) }
      .to raise_error(/Windows must be a non-negative integer/)
  end
end
