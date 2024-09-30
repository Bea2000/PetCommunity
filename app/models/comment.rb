# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :publication_id, :user_id, :description, presence: { message: 'Debes completas todas las casillas' }
  validates :publication_id, :user_id, numericality: { only_integer: { message: 'El valor debe ser numérico' } }

  belongs_to :publication
  belongs_to :user
end
