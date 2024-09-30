# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find_by(id: params[:id])
  end

  def new
    @chat = Chat.new
  end

  def create
    @chats_params = params.require(:chat).permit(:adoptant_id, :donator_id)
    @chat = Chat.create(@chats_params)
    if @chat.save
      redirect_to chats_index_path, notice: 'Chat creado'
    else
      render :new
    end
  end

  def edit
    @chat = Chat.find_by(id: params[:id])
  end

  def update
    @chat = Chat.find_by(id: params[:id])
    @chats_params = params.require(:chat).permit(:adoptant_id, :donator_id)

    if @chat.update(@chats_params)
      redirect_to chats_index_path, notice: 'Chat editado correctamente'
    else
      render :edit
    end
  end

  def delete
    @chat = Chat.find_by(id: params[:id])
    @chat.destroy
    redirect_to chats_index_path, notice: 'chat eliminado correctamente'
  end
end
