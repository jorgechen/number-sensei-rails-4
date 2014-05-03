class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :challenge_attempts

  has_one :experience_level, :through => :experience_level_user
  has_one :experience_level_user

  before_save { self.email = email.downcase }

  rolify
  #attr_accessible :role_ids, :as => :admin
  #attr_accessible :provider, :uid, :name, :email
  validates :name,
            :presence => true,
            :length => {maximum: 50},
            :format => {:with => /[a-zA-Z\d]+( [a-zA-Z\d]*)?/, :multiline => false}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            :presence => true,
            :uniqueness => { case_insensitive: false},
            :format => { with: VALID_EMAIL_REGEX }


  def to_s
    name
  end

  ############################################################################
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ''
        user.email = auth['info']['email'] || ''
      end
    end
  end


  # Devise for google_oauth2
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data['email']).first

    unless user
      user = User.create(name: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0,20]
      )
    end
    user
  end


end
