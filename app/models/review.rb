# frozen_string_literal: true

class Review < ApplicationRecord
  validates :adoptant, :user_id, :rating, :content,
            presence: { message: 'Debes completar todas las casillas requeridas' }
  validates :adoptant, numericality: { only_integer: true, message: 'El valor debe ser un número entero' }
  validates :user_id, numericality: { only_integer: true, message: 'El valor debe ser un número entero' }
  validates :rating, numericality: { only_float: true, message: 'El valor debe ser numérico' }
  validates :rating, inclusion: { in: 0..5, message: 'Valor sale del rango permitido (0-5)' }

  belongs_to :reviewed, class_name: 'User'
  has_one :reviewer, class_name: 'User', dependent: :destroy
end
