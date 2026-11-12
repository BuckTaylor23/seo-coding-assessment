# frozen_string_literal: true

require_relative '../../../../support/fixture_loader'

RSpec.describe DVLA::Wishy::Washy::Windows::CustomerBookings do
  let(:customers) { FixtureLoader.customers }
  let(:bookings) { FixtureLoader.bookings }
  let(:customer_bookings) { described_class.new(customers:, bookings:) }

  it 'finds the bookings on a date' do
    booking_numbers = customer_bookings.bookings_on('2025-10-01').map(&:booking_number)

    expect(booking_numbers).to contain_exactly(1, 3, 4)
  end

  it 'finds no bookings on a date without any' do
    expect(customer_bookings.bookings_on('2030-01-01')).to be_empty
  end

  it 'finds the customer for a booking' do
    booking = customer_bookings.booking(1)

    expect(customer_bookings.customer_for(booking).name).to eq('George')
  end

  it 'raises when the booking does not exist' do
    expect { customer_bookings.booking(99) }.to raise_error(KeyError, /Booking 99/)
  end

  it 'raises when the customer does not exist' do
    expect { customer_bookings.customer(99) }.to raise_error(KeyError, /Customer 99/)
  end
end
