class PagesController < ApplicationController
  def home
    render layout: "homepage_no_user"
  end
end
