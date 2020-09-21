# frozen_string_literal: true

require './lib/metrics_helper.rb'

include MetricsHelper

input = generate_input(25_000)
ash_test(input)
gary_test(input)
