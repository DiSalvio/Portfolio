class Tag < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, maximum: 20

  has_many :taggings
  has_many :posts, through: :taggings

  def self.counts
    pp = Post.published.pluck(:id)
    self.select("name, count(taggings.tag_id) as count").joins(:taggings).where("taggings.post_id in (?)", pp).group("taggings.tag_id, name").order(count: :desc).limit(5)
  end
end
