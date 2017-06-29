class User < ApplicationRecord
  after_save :call_avatar_service
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },:path => "avatars/:id/:style/:filename"

  do_not_validate_attachment_file_type :avatar



  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable#, :omniauthable
  include DeviseTokenAuth::Concerns::User
  private

  def call_avatar_service
    if self.image_changed?
      self.processed_image=false
      create_avatar_service = CreateAvatar.new(self)
      create_avatar_service.call
    end
  end
end
