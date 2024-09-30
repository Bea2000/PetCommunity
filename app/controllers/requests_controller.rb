# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def new
    @request = Request.new
  end

  def create
    @requests_params = params.require(:request).permit(:donator_id, :adoptant_id, :state, :publication_id)
    @request = Request.create(@requests_params)
    if @request.save
      redirect_to requests_index_path, notice: 'La solicitud ha sido creada correctamente'
    else
      render :new
    end
  end

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find_by(id: params[:id])
  end

  def edit
    @request = Request.find_by(id: params[:id])
  end

  def update
    @request = Request.find_by(id: params[:id])
    @requests_params = params.require(:request).permit(:donator_id, :adoptant_id, :state, :publication_id)

    if @request.update(@requests_params)
      redirect_to requests_index_path, notice: 'La solicitud ha sido editada correctamente'
    else
      render :edit
    end
  end

  def delete
    @request = Request.find_by(id: params[:id])
    @request.destroy
    redirect_to requests_index_path, notice: 'La solicitud ha sido eliminada'
  end
end
