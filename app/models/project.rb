class Project < ActiveRecord::Base
  validates_presence_of :name, :description
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }

  def to_param
    name
  end
end
