class Article < ActiveRecord::Base
  has_one :image, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates_presence_of   :titre, length: { minimum: 5 }
  validates_presence_of   :contenu
  validates_presence_of :user_id
  has_attached_file :image, styles: { large: "900x300>", medium: "300x300>", thumb: "150x150>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  default_scope -> {order('created_at DESC')}

end
