# frozen_string_literal: true

require 'set'

# Third solution (Ash) considers the Set objetct since we do not have to store.
# Since the Set object implements a collection of unordered values with no
# duplicates, the insertion of new ellements shows also very interesting
# results
class Ash
  def run
    input = ARGV[0]
    puts catch_pokemons(input)
  end

  def catch_pokemons(input)
    @current_position = [0, 0]
    @pokemon_positions = Set.new
    @pokemon_positions << @current_position.dup
    if !input.nil? && !input.empty?
      input.split('').each { |move| update_pokemon_positions(move) }
    end
    @pokemon_positions.size
  end

  private

  def update_pokemon_positions(move)
    case move
    when 'N'
      @current_position[1] += 1
    when 'S'
      @current_position[1] -= 1
    when 'E'
      @current_position[0] += 1
    when 'O'
      @current_position[0] -= 1
    end
    @pokemon_positions << @current_position.dup
  end
end
