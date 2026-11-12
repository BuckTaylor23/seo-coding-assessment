# frozen_string_literal: true

module DVLA
  module Wishy
    module Washy
      module Windows
        class WindowCleaningService
          def initialize(customer_bookings)
            @customer_bookings = customer_bookings
          end

          def total_windows_on(date)
            @customer_bookings.bookings_on(date).sum { |booking| @customer_bookings.customer_for(booking).windows }
          end

          def total_cost_for(booking_number:)
            booking = @customer_bookings.booking(booking_number)
            CostCalculator.cost_in_pounds(windows: @customer_bookings.customer_for(booking).windows)
          end
        end
      end
    end
  end
end
