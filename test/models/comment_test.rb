require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    @forum = Forum.create(topic: "test", description: "test", user: @user)
    @comment = @forum.comments.create(comment: "test", user: @user)
  end

  test "create new comment" do 
    assert @comment.valid?
  end 

  test "comment should belongs to a user" do 
    @comment2 = @forum.comments.create(comment: "test")
    assert_not @comment2.valid? 
  end 
end
