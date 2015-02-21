class User < ActiveRecord::Base
    has_many :tasks
    
    validates :nombre, presence: true
    validates :apellido, presence: true
    validates :correo, presence: true
end
