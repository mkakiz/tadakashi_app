class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
    if params[:content_key]
      @posts = Post.where('content LIKE ?', "%#{params[:content_key]}%")
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
    @comment = Comment.new(post_id: @post.id)
  end

  def new
    @post = Post.new
    @content_max_length = Post::CONTENT_MAX_LENGTH
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      address: params[:address] #Add for address
    )

    if @post.save #DB保存して、@post.id発行
      if params[:image]
        @post.post_image_name = "#{@post.id}.jpg"
        image = params[:image]
        File.binwrite("public/post_images/#{@post.post_image_name}", image.read)
        @post.save
      end
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.address = params[:address] #Add for address
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end



end
