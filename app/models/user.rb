class User < ApplicationRecord
  #rails g model user first_name:string last_name:string email:string:uniq password_digest:string
  validates :first_name, :last_name, presence: true #can validate all
  validates :email, 
    presence: true, 
    uniqueness: { case_sensitive: false },
    format: {
      with: /\A[A-Z0-9#-_~!$&'()*+,;=:.]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    }  
  has_many :products, dependent: :destroy ##when the user is deleted all the products will be deleted which is associated
  has_many :comments, dependent: :destroy

  has_secure_password ## using bcrypt from gem
  before_save :downcase_email

  def fullname
    "#{first_name} #{last_name}"
  end
  
  private

  def downcase_email
    self.email.downcase!
  end



end

#regex using rabular /Josh/ =~ 'My name is Josh' 