class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :invite_code

  has_one     :board

  before_validation :invited?
  after_create      :create_board

  def admin?
    role == 'admin'
  end

  def invited?
    if invite_code.blank? || !InviteCode.exists?(:code => invite_code)
      errors.add :invite_code, "doesn't exist"
    end
  end

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
