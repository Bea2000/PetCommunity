# frozen_string_literal: true

class PublicationsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show search]
  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find_by(id: params[:id])
    @user_name = User.find_by(id: @publication.user_id).name
    @comments = Comment.all
    @users = User.all
  end

  def new
    @publication = Publication.new
  end

  def create
    @publications_params = params.require(:publication).permit(:user_id, :title, :kind, :price,
                                                               :direction, :species, :image)
    @publication = Publication.create(@publications_params)
    if @publication.save
      redirect_to publications_index_path, notice: 'Publicacion creada correctamente'
    else
      render :new
    end
  end

  respond_to :html
  def search
    query = params[:search]
    results = Publication.where('title LIKE ?', "%#{query}%")

    if params[:filter] == 'Selecciona una opción'
      @publications = results
    else
      symbol = params[:filter]
      @publications = results.where(kind: symbol)
    end
  end

  def edit
    @publication = Publication.find_by(id: params[:id])
  end

  def update
    @publication = Publication.find_by(id: params[:id])
    @publications_params = params.require(:publication).permit(:user_id, :title, :kind, :price,
                                                               :direction, :species, :image)

    if @publication.update(@publications_params)
      redirect_to publications_index_path, notice: 'Publicacion editada correctamente'
    else
      render :edit
    end
  end

  def delete
    @publication = Publication.find_by(id: params[:id])
    if (@publication.user_id == current_user.id) | (current_user.admin_role)
      @publication.destroy
      redirect_to publications_index_path, notice: 'La publicacion ha sido eliminada'
    end
  end
end
