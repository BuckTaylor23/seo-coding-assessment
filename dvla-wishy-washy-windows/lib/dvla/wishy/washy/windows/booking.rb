# frozen_string_literal: true

module DVLA
  module Wishy
    module Washy
      module Windows
        class Booking
          attr_reader :booking_number, :customer_number, :date

          def initialize(booking_number:, customer_number:, date:)
            @booking_number = Validation.positive_integer(booking_number, 'booking_number')
            @customer_number = Validation.positive_integer(customer_number, 'customer_number')
            @date = Validation.is_a_date(date)
          end
        end
      end
    end
  end
end
