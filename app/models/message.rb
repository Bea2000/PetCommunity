class Message < ApplicationRecord
  validates :sender_id, :reciever_id, presence: { message: 'Debes completar todas las casillas' }
  validates :sender_id, :reciever_id, numericality: { only_integer: true, message: 'El valor debe ser numérico' }

  belongs_to :sender, class_name: 'User', dependent: :destroy, inverse_of: false
  belongs_to :reciever, class_name: 'User', dependent: :destroy, inverse_of: false

  has_one :content
  belongs_to :chat
end
