class User < ActiveRecord::Base

attr_accessor :remember_token

before_save { self.email = email.downcase }

validates :name, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates   :email, presence: true, length: { maximum: 255 },
			format: { with: VALID_EMAIL_REGEX },
			uniqueness: { case_sensitive: false }

# tiene que se un numero
#validates :numero_contacto, presence: true
# calle
#validates :calle_envio, presence: true
# tiene que se un numero
#validates :numero_envio, presence: true
# comuna
#validates :comuna_envio, presence: true

has_secure_password
validates :password, length: { minimum: 6 }

# Returns the hash digest of the given string, crea encriptacion
def User.digest(string)
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	BCrypt::Engine.cost
	BCrypt::Password.create(string, cost: cost)
end

# crea un token clave
def User.new_token
SecureRandom.urlsafe_base64
end

#actualiza en base datos el nuevo token remember_diges encriptando el remmeber token con user.digest
def remember
self.remember_token = User.new_token
update_attribute(:remember_digest, User.digest(remember_token))
end

# Returns true if the given token matches the digest.
# Returns true if the given token matches the digest.
def authenticated?(remember_token)
if remember_digest.nil?
false
else
BCrypt::Password.new(remember_digest).is_password?(remember_token)
end
end

# Forgets a user.
def forget
update_attribute(:remember_digest, nil)
end

end
