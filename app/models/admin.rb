class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, and :omniauthable
  devise :timeoutable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
