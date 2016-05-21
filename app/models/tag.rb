class Tag < ActiveRecord::Base
  validates_presence_of :name

  has_many :taggings
  has_many :posts, through: :taggings

  def self.counts
    pp = Post.published.pluck(:id)
    self.select("name").joins(:taggings).where("taggings.post_id in (?)", pp).group("name")
  end
end
