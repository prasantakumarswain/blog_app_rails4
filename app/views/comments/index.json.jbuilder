json.array!(@comments) do |comment|
  json.extract! comment, :id, :name, :body, :user_id, :blog_id
  json.url comment_url(comment, format: :json)
end
