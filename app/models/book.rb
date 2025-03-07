class Book < ApplicationRecord
  has_many :book_comments
  has_many :favorites, dependent: :destroy
  belongs_to :user
  validates :title,presence:true
  validates :body,presence:true,length:{ maximum: 200 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%' + content)
    else
      Book.where('title LIKE ?', '%' + content + '%')
    end
  end

end
