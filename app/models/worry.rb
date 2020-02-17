class Worry < ApplicationRecord
    validates :content, presence: true, length:{maximum:130}
    mount_uploader :image, ImageUploader
   belongs_to :user
   has_many :comments
   
  def user
    return User.find_by(id: self.user_id)
  end
  
  default_scope -> { order(created_at: :desc) }
end