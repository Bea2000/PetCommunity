# frozen_string_literal: true

class Publication < ApplicationRecord
  validates :user_id, :title, :kind, :direction, :species, :image,
            presence: { message: 'Debes completar todas las casillas requeridas' }
  validates :user_id, numericality: { only_integer: true, message: 'El valor debe ser numérico' }
  validates :price, numericality: { only_integer: true, message: 'El valor debe ser numérico' }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :commenters, through: :comments, class_name: 'User'
  has_many :requests, dependent: :destroy

  has_one_attached :image
end
