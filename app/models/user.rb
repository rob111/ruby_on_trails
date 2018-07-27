class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
  validates :username, presence: true, uniqueness: true

  mount_uploader :profile_photo, ProfilePhotoUploader

  def to_param
    username
  end

  def admin?
    role == "admin"
  end

  def admin_access
    if !user_signed_in || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end

end
