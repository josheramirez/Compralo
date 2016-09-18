class Compra < ActiveRecord::Base
  belongs_to :micropost
  belongs_to :user
  has_many :microposts
  has_many :pedidos
end

