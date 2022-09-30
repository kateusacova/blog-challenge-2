require_relative "../lib/database_connection.rb"
require_relative "../lib/tag.rb"

class TagRepository
  def find_by_post(post_id)
    query = "SELECT tags.id,
            tags.name 
            FROM tags 
              JOIN posts_tags ON posts_tags.tag_id = tags.id	
              JOIN posts ON posts.id = posts_tags.post_id
            WHERE posts.id = $1;"
    params = [post_id]
    result = DatabaseConnection.exec_params(query, params)

    tags = []
    
    result.each { |record| 
      tag = Tag.new
      tag.id = record["id"]
      tag.name = record["name"]

      tags << tag
    }

    tags
  end
end