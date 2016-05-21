class Post < ActiveRecord::Base
  validates_presence_of :title, :content
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }

  has_many :taggings
  has_many :tags, through: :taggings

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts.published.reverse
  end

  def draft?
    self.published == false
  end
end
