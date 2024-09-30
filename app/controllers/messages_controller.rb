# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @messages_params = params.require(:message).permit(:sender_id, :reciever_id, :content, :chat_id)
    @message = Message.create(@messages_params)
    if @message.save
      redirect_to chats_show_path(@messages_params['chat_id'].to_i), notice: 'Mensaje enviado!'
    else
      render :new
    end
  end

  # en todo caso, no se que tan legal sea hacer updates de mensajes
  def update
    @message = Message.find_by(id: params[:id])
    @messages_params = params.require(:message).permit(:sender_id, :reciever_id, :content, :chat_id)

    if @message.update
      redirect_to messages_index_path, notice: 'El mensaje ha sido creado correctamente'
    else
      redirect_to messages_index_path, notice: 'Error al crear mensaje'
    end
  end

  def edit
    @message = Message.find_by(id: params[:id])
  end

  def show
    @message = Message.find_by(id: params[:id])
  end

  def delete
    @message = Message.find_by(id: params[:id])
    # id_p = @comment.publication_id.to_i
    @message.destroy
    # lo otro que estaria bueno seria borrarlo y que salga un custom
    # como los de wsp de que borraste el mensaje, pero es un nice to have nomas
  end
end
