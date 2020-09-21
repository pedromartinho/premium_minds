# frozen_string_literal: true

require './lib/ash.rb'
require './lib/gary.rb'
require './lib/profile_helper.rb'

include ProfileHelper

module MetricsHelper
  def generate_input(n_directions)
    directions = %w[N S E O]
    (0..n_directions).map { directions[rand(directions.length)] }.join
  end

  def ash_test(input)
    ash = Ash.new
    profile do
      puts ash.catch_pokemons(input)
    end
  end

  def gary_test(input)
    gary = Gary.new
    profile do
      puts gary.catch_pokemons(input)
    end
  end
end
