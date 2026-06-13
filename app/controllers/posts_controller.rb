class PostsController < ApplicationController


  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(
      title: params[:post][:title],
      content: params[:post][:content]
    )

    if @post.save
      redirect_to @post, notice: "Post Created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /posts/:id/edit
  def edit
    @post = Post.find(params[:id])
  end

  # PATCH /posts/:id
  def update
    @post = Post.find(params[:id])

    if @post.update(
      title: params[:post][:title],
      content: params[:post][:content]
    )
      redirect_to @post, notice: "Post Updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, notice: "Post Deleted!"
  end
end
