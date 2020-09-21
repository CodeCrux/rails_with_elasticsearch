class Company < ActiveRecord::Base
	has_many :articles
end