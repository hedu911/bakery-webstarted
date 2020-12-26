class OvensController < ApplicationController
  before_action :authenticate_user!

  def index
    @ovens = current_user.ovens
  end

  def show
    @oven = current_user.ovens.find_by!(id: params[:id])
    @cookie = @oven.cookies.first
  end

  def empty
    @oven = current_user.ovens.find_by!(id: params[:id])
    if @oven.cookies.any?
      @oven.cookies.map{ |c| c.update_attributes!(storage: current_user) }
    end
    redirect_to @oven, alert: 'Oven emptied!'
  end
end
