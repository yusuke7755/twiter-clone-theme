class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :destroy]

    def index
      @post = Post.all
    end
  
    def new
       @post = Post.new
    end
  
    def edit
    end

  def create
    @post = Post.new(post_params)

    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "つぶやきを書き込みました。"
      else
        render :new
      end
    end
  end

  def update
    if params[:back]
      render :edit
    elsif @post.update(post_params)
      redirect_to posts_path, notice: "つぶやきが変わりました。"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"つぶやきをけしました。"
  end

  def confirm
    @post = Post.new(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
