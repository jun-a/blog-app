class Post < ActiveRecord::Base
	
  attr_accessible :post_date, :content

  belongs_to :user
	belongs_to :category

	has_and_belongs_to_many :tags

  scope :willpost, -> { where('post_date >= ?', Date.today) }   #scopeを用いて投稿日時を探し出す

  class << self
    def willpost_content?(contents)
      contents = content.willpost
    end
  end

end
