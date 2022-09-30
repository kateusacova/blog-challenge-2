require_relative "../lib/post_repository.rb"

def reset_tables
  seed_sql = File.read('spec/posts_tags_seeds.sql')
  connection = PG.connect({ host: ENV['HOST'], dbname: 'blog_2_test', user: 'postgres', password: ENV['PASSWORD'] })
  connection.exec(seed_sql)
end

RSpec.describe PostRepository do
  before(:each) do
    reset_tables
  end

  it "Returns an array of Post objects which correspond to the sepcified tag" do
    post_repository = PostRepository.new 
    posts = post_repository.find_by_tag('coding')
    expect(posts.first.title).to eq 'How to use Git'
  end
end
