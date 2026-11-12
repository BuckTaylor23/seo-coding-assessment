# frozen_string_literal: true

require_relative '../../../../support/fixture_loader'

RSpec.describe DVLA::Wishy::Washy::Windows::WindowCleaningService do
  let(:service) { described_class.new(FixtureLoader.customer_bookings) }

  describe '#total_windows_on' do
    it 'adds up the windows for every booking on the date' do
      expect(service.total_windows_on('2025-10-01')).to eq(26)
    end

    it 'returns 0 when nothing is booked on the date' do
      expect(service.total_windows_on('2030-01-01')).to eq(0)
    end

    it 'rejects an invalid date' do
      expect { service.total_windows_on('nope') }.to raise_error(/invalid date/)
    end
  end

  describe '#total_cost_for' do
    it 'charges £5 plus £1 per window for booking 1' do
      expect(service.total_cost_for(booking_number: 1)).to eq(9)
    end

    it 'charges £5 plus £1 per window for booking 3' do
      expect(service.total_cost_for(booking_number: 3)).to eq(15)
    end

    it 'raises when the booking does not exist' do
      expect { service.total_cost_for(booking_number: 99) }.to raise_error(KeyError, /Booking 99/)
    end
  end
end
