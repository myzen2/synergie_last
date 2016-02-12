class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates_presence_of   :titre, length: { minimum: 5 }
  validates_presence_of   :contenu
end
