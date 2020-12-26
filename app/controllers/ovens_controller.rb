class OvensController < ApplicationController
  before_action :authenticate_user!

  def index
    @ovens = current_user.ovens
  end

  def show
    @oven = current_user.ovens.find_by!(id: params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => {isOvenBusy: (!@oven.cookie.nil? && !@oven.cookie.ready?)}.to_json }
    end
  end

  def detail
    @oven = current_user.ovens.find_by!(id: params[:id])
    render layout:false
  end

  def empty
    @oven = current_user.ovens.find_by!(id: params[:id])
    if @oven.cookie
      @oven.cookie.update_attributes!(storage: current_user)
    end
    redirect_to @oven, alert: 'Oven emptied!'
  end
end
