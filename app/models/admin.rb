class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, and :omniauthable
  devise :timeoutable, :database_authenticatable, :lockable, :trackable

  def self.set_admin
    @admin = Admin.first
  end
end
