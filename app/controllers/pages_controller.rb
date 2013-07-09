class PagesController < ApplicationController
  def home
    if current_user
      @my_lists = Army.where("user_id = ?", current_user)
    else
      render layout: "homepage_no_user"
    end
  end
end
