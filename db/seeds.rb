users = [
  { name: "Alice", email: "alice@example.com" },
  { name: "Bob", email: "bob@example.com" },
  { name: "Charlie", email: "charlie@example.com" },
  { name: "Diana", email: "diana@example.com" }
].map { |attrs| User.find_or_create_by!(email: attrs[:email]) { |u| u.name = attrs[:name] } }

alice, bob, charlie, diana = users

posts = [
  { title: "First Post", content: "This is the first post.", creator: alice },
  { title: "Second Post", content: "This is the second post.", creator: bob },
  { title: "Third Post", content: "This is the third post.", creator: alice }
].map { |attrs| Post.find_or_create_by!(title: attrs[:title]) { |p| p.content = attrs[:content]; p.user_id = attrs[:creator].id; p.creator = attrs[:creator] } }

first_post, second_post, third_post = posts

editors = [
  { post: first_post, editor: bob },
  { post: first_post, editor: charlie },
  { post: second_post, editor: diana },
  { post: third_post, editor: bob },
  { post: third_post, editor: diana }
]

editors.each do |attrs|
  PostEditor.find_or_create_by!(post: attrs[:post], editor: attrs[:editor])
end
