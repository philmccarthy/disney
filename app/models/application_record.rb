class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.exact_name_match(keyword)
    where("name like ?", keyword)
  end

  def self.partial_name_match(keyword)
    where("name like ?", "%#{keyword}%")
  end
end
