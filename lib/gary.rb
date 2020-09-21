# frozen_string_literal: true

# Second solution (Gary) considers an hash with the X-axis as the hash keys and
# the Y-axis values are stores in each of the key values. This results in much
# validation of new points before consider a new pokemon was found
class Gary
  def run
    input = ARGV[0]
    puts catch_pokemons(input)
  end

  def catch_pokemons(input)
    @x = 0
    @y = 0
    @pokemon_positions = { 0 => [0] }
    n_pokemons = 0
    if !input.nil? && !input.empty?
      input.split('').each { |move| update_pokemon_positions(move) }
    end
    @pokemon_positions.each { |r| n_pokemons += r[1].length }
    n_pokemons
  end

  private

  def update_position(move)
    case move
    when 'N'
      @y += 1
    when 'S'
      @y -= 1
    when 'E'
      @x += 1
    when 'O'
      @x -= 1
    end
  end

  def update_pokemon_positions(move)
    update_position(move)
    if @pokemon_positions[@x].nil?
      @pokemon_positions[@x] = [@y.dup]
    elsif !@pokemon_positions[@x].include?(@y)
      @pokemon_positions[@x] << @y.dup
    end
  end
end
