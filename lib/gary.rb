# frozen_string_literal: true

class Gary
  def run
    input = ARGV[0]
    puts catch_pokemons(input)
  end

  def catch_pokemons(input)
    @@current_position = [0, 0]
    @@pokemon_positions = [[0, 0]]
    if !input.nil? && !input.empty?
      input.split('').each { |move| update_pokemon_positions(move) }
    end
    @@pokemon_positions.size
  end

  private

  def update_position(move)
    case move
    when 'N'
      @@current_position[1] += 1
    when 'S'
      @@current_position[1] -= 1
    when 'E'
      @@current_position[0] += 1
    when 'O'
      @@current_position[0] -= 1
    end
  end

  def update_pokemon_positions(move)
    update_position(move)
    unless @@pokemon_positions.include?(@@current_position)
      @@pokemon_positions << @@current_position.dup
    end
  end
end
