json.extract! post, :id, :author, :title, :body, :tags, :published, :published_on, :created_at, :updated_at
json.url post_url(post, format: :json)
