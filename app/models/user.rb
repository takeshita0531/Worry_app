class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image_name, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :worries, dependent: :destroy
         has_many :comments
         
         def worries
           return Worry.where(user_id: self.id)
           
         end
         
end
