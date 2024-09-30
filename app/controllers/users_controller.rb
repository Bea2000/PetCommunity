# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to welcome_index_path, notice: 'Tu cuenta ha sido eliminada' if @user.destroy
  end
end
