class PagesController < ApplicationController
  

  def home
    get_admin
  end

  private

  def get_admin
    @admin = Admin.first
  end
end
