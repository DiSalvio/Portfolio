class PagesController < ApplicationController
  before_action :authenticate_admin!

  def home
    get_admin
  end


  private

  def get_admin
    @admin = Admin.first
  end
end
