# frozen_string_literal: true

module DVLA
  module Wishy
    module Washy
      module Windows
        class CustomerBookings
          def initialize(customers: [], bookings: [])
            @customers = customers.to_h { |customer| [customer.customer_number, customer] }
            @bookings = bookings.to_h { |booking| [booking.booking_number, booking] }
          end

          def customer(customer_number)
            @customers.fetch(customer_number) { raise KeyError, "Customer #{customer_number.inspect} not found" }
          end

          def booking(booking_number)
            @bookings.fetch(booking_number) { raise KeyError, "Booking #{booking_number.inspect} not found" }
          end

          def bookings_on(date)
            parsed_date = Validation.is_a_date(date)
            @bookings.values.select { |booking| booking.date == parsed_date }
          end

          def customer_for(booking)
            customer(booking.customer_number)
          end
        end
      end
    end
  end
end
