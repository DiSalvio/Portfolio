class Project < ActiveRecord::Base
  validates_presence_of :name, :description
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }


  def self.latest
    order(created_at: :desc)
  end

  def to_param
    name
  end

  def draft?
    self.published == false 
  end
end
