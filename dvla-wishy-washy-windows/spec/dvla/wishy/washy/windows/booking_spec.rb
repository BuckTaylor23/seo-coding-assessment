# frozen_string_literal: true

RSpec.describe DVLA::Wishy::Washy::Windows::Booking do
  it 'creates a booking from a date string' do
    booking = described_class.new(booking_number: 1, customer_number: 4, date: '2025-10-01')

    expect(booking.booking_number).to eq(1)
    expect(booking.customer_number).to eq(4)
    expect(booking.date).to eq(Date.new(2025, 10, 1))
  end

  it 'creates a booking from a Date' do
    booking = described_class.new(booking_number: 1, customer_number: 4, date: Date.new(2025, 10, 1))

    expect(booking.date).to eq(Date.new(2025, 10, 1))
  end

  it 'rejects a booking number of zero' do
    expect { described_class.new(booking_number: 0, customer_number: 4, date: '2025-10-01') }
      .to raise_error(/Booking number must be a positive integer/)
  end

  it 'rejects a customer number of zero' do
    expect { described_class.new(booking_number: 1, customer_number: 0, date: '2025-10-01') }
      .to raise_error(/Customer number must be a positive integer/)
  end

  it 'rejects a date in the wrong format' do
    expect { described_class.new(booking_number: 1, customer_number: 4, date: '01/10/2025') }
      .to raise_error(/invalid date/)
  end

  it 'rejects a missing date' do
    expect { described_class.new(booking_number: 1, customer_number: 4, date: nil) }
      .to raise_error(/Date must be/)
  end
end
