class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :board

  after_create :create_board

private

  def create_board
    p "(((((((((((((((((((((((((((((((((())))))))))))))))))))))))))))))))))"
    token = PivotalTracker::Client.token = nil
    token = PivotalTracker::Client.token(email, password)
    p email
    p password
    p token
    Board.create(:token => token, :user => self)
    p "(((((((((((((((((((((((((((((((((())))))))))))))))))))))))))))))))))"
  end
end
