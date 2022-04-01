require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    user = User.create!(name: 'Mre', photo: 'http://photo.com', bio: 'Hello rails', postsCounter: 5)
    @post = Post.new(title: 'New Post', text: 'This is a new text', author: user, commentsCounter: 5, likesCounter: 5)
  end

  it 'should be valid with the correct parameters' do
    expect(@post).to be_valid
  end

  it 'name must be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'commentsCounter must be an integer' do
    @post.commentsCounter = 1.5
    expect(@post).to_not be_valid
  end

  it 'commentsCounter must be greater than 0' do
    @post.commentsCounter = -3
    expect(@post).to_not be_valid
  end

  it 'likesCounter must be an integer' do
    @post.likesCounter = 1.5
    expect(@post).to_not be_valid
  end

  it 'likesCounter must be greater than 0' do
    @post.likesCounter = -3
    expect(@post).to_not be_valid
  end
  
end