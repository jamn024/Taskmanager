class User < ActiveRecord::Base
    validates :nombre, presence: true
    validates :apellido, presence: true
    validates :correo, presence: true
end
