class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.exact_match(keyword, column)
    where("#{column} like ?", keyword)
  end

  def self.partial_match(keyword, column)
    where("#{column} like ?", "%#{keyword}%")
  end
end
