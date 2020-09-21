class User < ActiveRecord::Base

	#update_index('users#user') { self }
  #enum status: { unconfirmed: 0, confirmed: 1 }
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
