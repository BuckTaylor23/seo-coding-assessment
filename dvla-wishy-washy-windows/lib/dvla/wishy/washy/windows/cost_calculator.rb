# frozen_string_literal: true

module DVLA
  module Wishy
    module Washy
      module Windows
        module CostCalculator
          COST_PER_PROPERTY_IN_POUNDS = 5
          COST_PER_WINDOW_IN_POUNDS = 1

        module_function

          def cost_in_pounds(windows:)
            COST_PER_PROPERTY_IN_POUNDS + (windows * COST_PER_WINDOW_IN_POUNDS)
          end
        end
      end
    end
  end
end
