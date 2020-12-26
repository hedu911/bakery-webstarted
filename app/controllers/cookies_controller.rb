class CookiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    if @oven.cookies.any?
      redirect_to @oven, alert: 'There are already cookies in the oven!'
    else
      @cookie = Cookie.new
      @cookie.storage = @oven
    end
  end

  def create
    @oven = current_user.ovens.find_by!(id: params[:oven_id])
    create_params[:count].to_i.times{ Cookie.create!(cookie_params.merge({storage:@oven})) }
    redirect_to oven_path(@oven)
  end

  private

  def create_params
    params.permit(:count)
  end

  def cookie_params
    params.require(:cookie).permit(:fillings)
  end
end
