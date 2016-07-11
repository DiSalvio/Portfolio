class Post < ActiveRecord::Base
  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  mount_uploader :image, ImageUploader

  validates_presence_of :title, :content
  validates :image, file_size: { less_than: 2.gigabytes, message: 'File size must be less than 2gb' },
                    file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'], message: 'File type must be jpeg, jpg, png, or gif' }


  def self.latest
    order(updated_at: :desc)
  end

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
