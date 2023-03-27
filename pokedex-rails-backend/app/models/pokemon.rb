# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord

    has_many{
        :poke_moves,
        primary_key: :id,
        foreign_key: :pokemon_id,
        class_name: :PokeMove,
        dependent: :destroy
    }

    has_many{
        :moves,
        through: :poke_moves,
        source: :move,
        dependent: :destroy
    }


end
