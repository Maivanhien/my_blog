class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  is_impressionable
  belongs_to :author
  has_many :elements
  has_one_attached :header_image
  validates_presence_of :title, :description
  validates_length_of :description, minimum: 10
  def should_generate_new_friendly_id?
    title_changed?
  end
  scope :published, -> do
  	where(published: true)
  end
  scope :most_recently_published, -> do
    order(published_at: :desc)
  end
  scope :most_impressionist, -> do
    Post.joins(:impressions).group("posts.id, impressions.impressionable_id").order("count(impressions.impressionable_id) DESC")
  end
  def published?
  	published == true
  end
end
