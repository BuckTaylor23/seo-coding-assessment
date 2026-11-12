# frozen_string_literal: true

require 'json'

module FixtureLoader
  FIXTURE_DIRECTORY = File.expand_path('../fixtures', __dir__)

module_function

  def customers(name = 'sample_data')
    read(name)[:customers].map { |attributes| DVLA::Wishy::Washy::Windows::Customer.new(**attributes) }
  end

  def bookings(name = 'sample_data')
    read(name)[:bookings].map { |attributes| DVLA::Wishy::Washy::Windows::Booking.new(**attributes) }
  end

  def customer_bookings(name = 'sample_data')
    DVLA::Wishy::Washy::Windows::CustomerBookings.new(customers: customers(name), bookings: bookings(name))
  end

  def read(name)
    json = File.read(fixture_path(name))
    JSON.parse(json, symbolize_names: true)
  end

  def fixture_path(name)
    File.join(FIXTURE_DIRECTORY, "#{name}.json")
  end
end
