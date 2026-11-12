# frozen_string_literal: true

module DVLA
  module Wishy
    module Washy
      module Windows
        module Validation
        module_function

          def positive_integer(value, field)
            return value if value.is_a?(Integer) && value.positive?

            raise "#{field.capitalize.tr('_', ' ')} must be a positive integer, got #{value}"
          end

          def non_negative_integer(value, field)
            return value if value.is_a?(Integer) && !value.negative?

            raise "#{field.capitalize.tr('_', ' ')} must be a non-negative integer, got #{value}"
          end

          def is_a_string(value, field)
            return value.strip if value.is_a?(String) && !value.strip.empty?

            raise "#{field.capitalize.tr('_', ' ')} must be a non-empty string, got #{value}"
          end

          def is_a_date(value)
            return value if value.is_a?(Date)
            return Date.iso8601(value) if value.is_a?(String)

            raise "Date must be a Date or ISO 8601 string, got #{value}"
          end
        end
      end
    end
  end
end
