require_relative "../lib/tag_repository.rb"

def reset_tables
  seed_sql = File.read('spec/posts_tags_seeds.sql')
  connection = PG.connect({ host: ENV['HOST'], dbname: 'blog_2_test', user: 'postgres', password: ENV['PASSWORD'] })
  connection.exec(seed_sql)
end

RSpec.describe TagRepository do
  before(:each) do
    reset_tables
  end

  it "Returns an array of Tag objects which correspond to the sepcified post id" do
    tag_repository = TagRepository.new 
    tags = tag_repository.find_by_post(1)
    expect(tags.first.name).to eq 'coding'
  end
end