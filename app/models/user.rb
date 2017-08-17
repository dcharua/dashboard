class User < ActiveRecord::Base
  #has_many:rents
  validates :username, presence: true, length:{minimum: 3, maximum: 35}
  before_save{self.email = email.downcase} #saves in lower case

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive:false},
  length:{minimum: 3, maximum: 80},
  format: {with: VALID_EMAIL_REGEX}

  has_secure_password
end

#en la clase de rents ... belongs_to :user
# para validar en clase rents... validates:user_id, presence: true
