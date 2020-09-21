# frozen_string_literal: true

require './lib/metrics_helper.rb'
include MetricsHelper

input = generate_input(25_000)
brock_test(input)
gary_test(input)
ash_test(input)

input = generate_input(1_000_000)
gary_test(input)
ash_test(input)
