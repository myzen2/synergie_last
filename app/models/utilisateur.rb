class Utilisateur < ActiveRecord::Base
  belongs_to :user
  has_many :articles

  #default_scope :order => 'articles.created_at DESC'
end
