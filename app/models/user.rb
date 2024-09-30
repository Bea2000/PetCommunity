# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :name, :number, :user_name, :password, :password_confirmation,
            presence: { message: 'Debes completar las casillas' }
  # validates :user_name, uniqueness: { message: ':Ya existe ese usuario' }

  has_and_belongs_to_many :chats
  has_many :reviews, dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviewers, through: :reviews, class_name: 'User'

  has_many :adoptants, through: :requests, class_name: 'User'
  has_many :donators, through: :requests, class_name: 'User'

  has_many :adoptants, through: :chats, class_name: 'User'
  has_many :donators, through: :chats, class_name: 'User'

  has_many :senders, through: :messages, class_name: 'User'
  has_many :recievers, through: :messages, class_name: 'User'

  has_many :requests_as_adoptant, foreign_key: 'adoptant_id', class_name: 'Request', inverse_of: 'donator'
  has_many :requests_as_donator, foreign_key: 'donator_id', class_name: 'Request', inverse_of: 'adoptant'

  has_many :chats_as_adoptant, foreign_key: 'adoptant_id', class_name: 'Chat', inverse_of: 'donator'
  has_many :chats_as_donator, foreign_key: 'donator_id', class_name: 'Chat', inverse_of: 'adoptant'

  has_many :messages_as_reciever, foreign_key: 'reciever_id', class_name: 'Message', inverse_of: 'sender'
  has_many :messages_as_sender, foreign_key: 'sender_id', class_name: 'Message', inverse_of: 'reciever'
end
