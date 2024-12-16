# frozen_string_literal: true

class Pokemon < ApplicationRecord
    validates :name, presence: true
    validates :abilities, presence: true
    validates :sprite_url, presence: true
  end
  
