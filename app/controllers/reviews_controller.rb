# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @reviews_params = params.require(:review).permit(:adoptant, :user_id, :rating, :content)
    @review = Review.create(@reviews_params)
    if @review.save
      redirect_to reviews_index_path, notice: 'Tu reseña ha sido subida correctamente'
    else
      render :new
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review = Review.find_by(id: params[:id])
    @reviews_params = params.require(:review).permit(:adoptant, :donator, :rating, :content)

    if @review.update(@reviews_params)
      redirect_to reviews_index_path, notice: 'Reseña editada correctamente'
    else
      render :edit
    end
  end

  def delete
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to reviews_index_path, notice: 'Reseña eliminada correctamente'
  end
end
