class Project < ActiveRecord::Base
  validates_presence_of :name, :description

  def to_param
    name
  end
end
