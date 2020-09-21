# frozen_string_literal: true

require 'spec_helper'

describe Ash do
  before do
    @ash = Ash.new
    @gary = Gary.new
  end

  let(:ash) { @ash }
  let(:gary) { @gary }
  describe 'simple valid inputs' do
    it 'two pokemons must be caught' do
      input = 'NSNS'
      expected_output = 2
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end

    it 'three pokemons must be caught' do
      input = 'EEOOEEOO'
      expected_output = 3
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end

    it 'eleven pokemons must be caught' do
      input = 'NNNNSSSSSSSSSS'
      expected_output = 11
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end

    it 'eight pokemons must be caught' do
      input = 'NNEESSOONNEESSOO'
      expected_output = 8
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end
  end

  describe 'ignore commands' do
    it 'one pokemon must be caught, since no input were provided' do
      input = ''
      expected_output = 1
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end

    it 'one pokemon must be caught, since all input provided are invalid' do
      input = 'QWRTYUIPADFGHJKLÇZXCVBM'
      expected_output = 1
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end

    it 'two pokemons must be caught, since part of the comands are invalid' do
      input = 'NASA'
      expected_output = 2
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end
  end

  describe 'huge inputs' do
    directions = %w[N S E O]
    it 'should have the same output as Gary - 100 0 direction' do
      input = (0..1000).map { directions[rand(directions.length)] }.join
      expected_output = gary.catch_pokemons(input)
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end

    it 'should have the same output as Gary - 100 00 direction' do
      input = (0..100_00).map { directions[rand(directions.length)] }.join
      expected_output = gary.catch_pokemons(input)
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end

    it 'should have the same output as Gary - 200 00 direction' do
      input = (0..200_00).map { directions[rand(directions.length)] }.join
      expected_output = gary.catch_pokemons(input)
      expect(ash.catch_pokemons(input)).to eq(expected_output)
    end
  end
end
