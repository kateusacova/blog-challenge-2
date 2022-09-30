require_relative "../lib/database_connection.rb"
require_relative "../lib/post.rb"

class PostRepository
  def find_by_tag(tag)
    query = "SELECT posts.id,
                    posts.title
                    FROM posts
                      JOIN posts_tags ON posts_tags.post_id = posts.id
                      JOIN tags ON tags.id = posts_tags.tag_id
                    WHERE tags.name = $1;"
    params = [tag]
    result = DatabaseConnection.exec_params(query, params)

    posts = []
    
    result.each { |record| 
      post = Post.new
      post.id = record["id"]
      post.title = record["title"]

      posts << post
    }

    posts
  end
end