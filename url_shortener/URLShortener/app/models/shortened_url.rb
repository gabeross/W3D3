class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, :user_id, presence: true
  
  
  def self.random_code
    #until SecureRandom return a string that does not exist in our table, keep regenerating
    #class.find_by, .find..., .exists? -> ShortenedUrl.exists?()
    random_url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(random_url)
      random_url = SecureRandom.urlsafe_base64
    end
    random_url
  end
  
  def self.shortener(user, full_url)
    ShortenedUrl.create!(long_url: full_url, short_url: ShortenedUrl.random_code, user_id: user.id)
  end
  
  belongs_to(:submitter, {
    primary_key: :id, #User.id, The thing in the other table that's being referenced
    foreign_key: :user_id, #ShortenedUrl.user_id, the thing in this table that references something else
    class_name: 'User' # The class of thing I expect this method to return 
  })
end

# has_many :somethings, -> method name
# primary_key: :id, -> the thing in this table being referenced
# foreign_key: :user_id, -> the thing in the other table referencing this table
# class_name: :ShortenedUrl -> the class of thing I expect the method to return


# has_many :something through
  # through: -> an association defined here,
  # source: -> an association defined on whatever the above association returns