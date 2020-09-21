require 'elasticsearch/model'
class Article < ActiveRecord::Base

  belongs_to :company

	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :name, analyzer: 'english'
      indexes :body, analyzer: 'english'
    end
  end

def self.search(query)
  __elasticsearch__.search(
    {
      query: {
        multi_match: {
          query: query,
          fields: ['name', 'body']
        }
      },
      highlight: {
        pre_tags: ['<em>'],
        post_tags: ['</em>'],
        fields: {
          name: {},
          body: {}
        }
      }

    }
  )
end

  # def as_indexed_json(options = nil)
  #   self.as_json( only: [ :name, :body ] )
  # end


# Delete the previous articles index in Elasticsearch
Article.__elasticsearch__.client.indices.delete index: Article.index_name rescue nil

# Create the new index with the new mapping
Article.__elasticsearch__.client.indices.create \
  index: Article.index_name,
  body: { settings: Article.settings.to_hash, mappings: Article.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Article.import

end
