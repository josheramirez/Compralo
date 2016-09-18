class Pedido < ActiveRecord::Base
  belongs_to :compra
  belongs_to :micropost
  
end
