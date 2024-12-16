# frozen_string_literal: true
module Api
  module V2
    class PokemonsController < ApplicationController
      def show
        if pokemon_info
          render json: pokemon_info
        else
          render json: { error: 'Pokémon not found' }, status: :not_found
        end
      end

      private

      def pokemon_name
        params[:pokemon_name].downcase
      end

      def pokemon_info
        pokemon = Pokemon.find_by(name: pokemon_name)
        return nil unless pokemon

        {
          name: pokemon.name,
          abilities: pokemon.abilities.split(', '),
          sprite: pokemon.sprite_url
        }
      end
    end
  end
end



# module Api
#   module V2
#     class PokemonsController < ApplicationController
#       def show
#         if pokemon_info
#           render json: pokemon_info
#         else
#           render json: { error: 'Pokémon not found' }, status: :not_found
#         end
#       end

#       def pokemon_name
#         params[:pokemon_name]
#       end

#       def pokemon_info
#         @pokemon_info = PokeapiService.get_pokemon_info(pokemon_name)
#       end
#     end
#   end
# end
