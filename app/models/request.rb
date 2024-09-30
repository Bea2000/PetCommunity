# frozen_string_literal: true

class Request < ApplicationRecord
  validates :donator_id, :adoptant_id, :state, :publication_id,
            presence: { message: 'Debes completar todas las casillas requeridas' }
  validates :adoptant_id, numericality: { only_integer: true, message: 'El valor debe ser numérico' }
  validates :donator_id, numericality: { only_integer: true, message: 'El valor debe ser numérico' }

  belongs_to :adoptant, class_name: 'User', dependent: :destroy, inverse_of: false
  belongs_to :donator, class_name: 'User', dependent: :destroy, inverse_of: false

  belongs_to :publication
end
