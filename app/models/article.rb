class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates_presence_of   :titre, length: { minimum: 5 }
  validates_presence_of   :contenu
  validates_presence_of   :user_id

  default_scope -> {order('created_at DESC')}

end
