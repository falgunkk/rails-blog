class Article < ApplicationRecord
  has_many:comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 3 }
  has_attached_file :avatar,styles:{ medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to  :user
end
