class Post < ActiveRecord::Base
  validates_presence_of :title, :content
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }

end
