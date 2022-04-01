require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(
      post: Post.new(
        user: User.new(
          name: 'Tom',
          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
          bio: 'Teacher from Mexico.',
          posts_counter: 0
        ),
        title: 'Hello',
        text: 'This is my first post',
        likes_counter: 0,
        comments_counter: 0
      ),
      user: User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     posts_counter: 0),
      text: 'This is the comment'
    )
  end

  before { subject.save }
end
