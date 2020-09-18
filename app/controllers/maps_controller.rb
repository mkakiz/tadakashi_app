class MapsController < ApplicationController

  def create
    @map = Map.new(user_id: @current_user.id, post_id: params[:post_id])
    @map.save
  end

end
