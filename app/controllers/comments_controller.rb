# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def new
    @comment = Comment.new
  end

  def create
    @comments_params = params.require(:comment).permit(:publication_id, :user_id, :description)
    @comment = Comment.create(@comments_params)
    if @comment.save
      redirect_to publications_show_path(@comments_params['publication_id'].to_i),
                  notice: 'Comentario creado correctamente'
    else
      render :new
    end
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comments_params = params.require(:comment).permit(:publication_id, :user_id, :description)
    if @comment.update(@comments_params)
      redirect_to publications_show_path(@comment.publication_id),
                  notice: 'El comentario ha sido editado correctamente'
    else
      render :edit
    end
  end

  def delete
    @comment = Comment.find_by(id: params[:id])
    id_p = @comment.publication_id.to_i
    @comment.destroy
    redirect_to publications_show_path(id_p)
  end
end
