class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :board

  after_create  :create_board

private

  def create_board
    PivotalTracker::Client.token = nil

    begin
      token = PivotalTracker::Client.token(email, password)
    rescue
    end

    Board.create(:token => token, :user => self)
  end
end
