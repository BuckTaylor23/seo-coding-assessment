# dvla-wishy-washy-windows

Stores window cleaning customers and bookings, curreently stored as JSON fixtures, and answers two questions:

1. How many windows are being cleaned on a given date?
2. How much does a booking cost? (£5 per property plus £1 per window)

## Requirements

Ruby 4.0 or later.

## Setup

```shell
bundle install
```

## Running the tests

```shell
bundle exec rake spec
```

## Usage

```ruby
require 'dvla/wishy/washy/windows'

include DVLA::Wishy::Washy::Windows

customers = [
  Customer.new(customer_number: 1, name: 'John', windows: 10),
  Customer.new(customer_number: 4, name: 'George', windows: 4)
]

bookings = [
  Booking.new(booking_number: 1, customer_number: 4, date: '2025-10-01'),
  Booking.new(booking_number: 3, customer_number: 1, date: '2025-10-01')
]

customer_bookings = CustomerBookings.new(customers:, bookings:)
service = WindowCleaningService.new(customer_bookings)

service.total_windows_on('2025-10-01')    # => 14
service.total_cost_for(booking_number: 1) # => 9
```

## Structure

| File                         | Purpose                                            |
|------------------------------|----------------------------------------------------|
| `customer.rb`                | Validates A customer on creation                   |
| `booking.rb`                 | Validates a booking on creation                    |
| `customer_bookings.rb`       | Customer and booking helper methods                |
| `validation.rb`              | Validation helper methods                          |
| `cost_calculator.rb`         | Calculates the price of windows to a property      |
| `window_cleaning_service.rb` | Main functions of Gem                              |
