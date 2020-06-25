class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy up_vote down_vote]
  before_action :make_user_owner, only: %i[edit update destroy]
  before_action :set_comment, only: :show

  def index
    @posts = Post.order(created_at: :desc)
    @new_comment = Comment.new
  end

  def show; end

  def new
    @post = Post.new
    @post.build_photo
  end

  def edit; end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def up_vote
    @post.liked_by(current_user)

    redirect_to request.referer, notice: 'Like successfully!'
  end

  def down_vote
    @post.unliked_by(current_user)

    redirect_to request.referer, notice: 'Unlike successfully!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_comment
    @new_comment = Comment.new
    @comments = @post.comments
  end

  def post_params
    params.require(:post).permit(:title, :description,
                                 photo_attributes: {})
  end

  def make_user_owner
    return unless @post.user.eql?(current_user)

    redirect_to root_url, notice: "You're not allowed to access this page"
  end
end
