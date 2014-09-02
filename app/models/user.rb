class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_secure_password

  validates_uniqueness_of :email, :user_name

  validates :email, presence: true,
                  uniqueness: { case_sensitive: false },
                  format: {
                    with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                  }

  before_save :downcase_userinfo

private
  def downcase_userinfo
    self.user_name = self.user_name.downcase if self.user_name
    self.email = self.email.downcase if self.email
  end

end
