# frozen_string_literal: true

require './lib/ash.rb'
require './lib/gary.rb'
require './lib/brock.rb'
require './lib/profile_helper.rb'

# Metrics Helper to evaluate the performance of each pokemon trainer
module MetricsHelper
  include ProfileHelper

  # Generate input with specified number of directions
  def generate_input(n_directions)
    directions = %w[N S E O] # Only valid directions
    (0..(n_directions - 1)).map { directions[rand(directions.length)] }.join
    # puts "\nGeneration Input of #{n_directions} directions...\n"
  end

  # Ash test to measure performance
  def ash_test(input)
    ash = Ash.new
    puts "\nAsh results on #{input.length} directions:"
    profile do
      ash.catch_pokemons(input)
    end
  end

  # Gary test to measure performance
  def gary_test(input)
    gary = Gary.new
    puts "\nGary results on #{input.length} directions:"
    profile do
      gary.catch_pokemons(input)
    end
  end

  # Gary test to measure performance
  def brock_test(input)
    brock = Brock.new
    puts "\nBrock results on #{input.length} directions:"
    profile do
      brock.catch_pokemons(input)
    end
  end
end
