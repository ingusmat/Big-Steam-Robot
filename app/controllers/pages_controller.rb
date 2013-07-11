class PagesController < ApplicationController
  def home
    if current_user
      @my_armies = Army.where("user_id = ?", current_user).order("created_at DESC")
      @public_armies = Army.where("user_id != ?", current_user).order("created_at DESC")
    else
      render layout: "homepage_no_user"
    end
  end
end
