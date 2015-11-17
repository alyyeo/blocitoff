class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :items, dependent: :destroy
  
  before_create :generate_auth_token
  
  def name
    name = self.email.split('@')[0]
  end
  
  def generate_auth_token
    loop do
      self.auth_token  = SecureRandom.base64(64)
      break unless User.find_by(auth_token: auth_token)
    end
  end
  
  protected
  def confirmation_required?
    false
  end
end
