class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
    render :new
  end

  def create
    @blog = Blog.create(blog_params)
    #binding.pry
    if @blog.save
      redirect_to blogs_path, notice:"投稿完了"
    else
      render :new
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"削除完了"
  end

  def show
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    redirect_to blogs_path
  end

  def confirm
   @blog = Blog.new(blog_params)
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
