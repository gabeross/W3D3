class ShortenedUrl
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
  
  def self.shortener(long_url.user, long_url)
    
    
  end
end