class User < ActiveRecord::Base

  rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)

    puts 'looking for : ' + warden_conditions.to_s

    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  validates :username,
            :uniqueness => {
                :case_sensitive => false
            }

  # ,            :format => { ... } # etc.

end
