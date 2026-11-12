# frozen_string_literal: true

module DVLA
  module Wishy
    module Washy
      module Windows
        class Customer
          attr_reader :customer_number, :name, :windows

          def initialize(customer_number:, name:, windows:)
            @customer_number = Validation.positive_integer(customer_number, 'customer_number')
            @name = Validation.is_a_string(name, 'name')
            @windows = Validation.non_negative_integer(windows, 'windows')
          end
        end
      end
    end
  end
end
