class User < ActiveRecord::Base
  has_many :galleries
  has_many :group_memberships
  has_many :group_memberships, foreign_key: "member_id"
  has_many :groups, through: :group_memberships

  has_many :likes
  has_many :images, through: :likes
  has_many :liked_images, through: :likes, source: :image
  #has_many :liked_images, through: :image, source: :image

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def membership_for(group)
    self.group_memberships.where(group_id: group.id).first
  end

  def like(image)
    #Like.create(image_id: image.id, user_id: id)
    images << image
    #liked_images << image 
  end

  def unlike(image)
    images.destroy(image)
  end
  
  def likes?(image)
    images.include?(image)
  end
end
