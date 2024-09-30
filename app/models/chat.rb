# frozen_string_literal: true

class Chat < ApplicationRecord
  validates :adoptant_id, :donator_id, presence: { message: 'Debes completar todas las casillas' }
  validates :adoptant_id, :donator_id, numericality: { only_integer: true, message: 'El valor debe ser numérico' }

  belongs_to :adoptant, class_name: 'User', dependent: :destroy, inverse_of: false
  belongs_to :donator, class_name: 'User', dependent: :destroy, inverse_of: false
  has_many :messages
end
