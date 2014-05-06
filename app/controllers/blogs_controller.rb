class BlogsController < ApplicationController
  #before_filter :authenticate_user!,except:[:index,:show]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    #@blog_published = Blog.where(publish: :true)
    @blogs = Blog.all
    #@blogs = Blog.where(publish: :true)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
    @blog_comments = @blog.comments
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = current_user.blogs.new(blog_params)
    if params[:commit]== "publish"
      @blog.publish = true
      if @blog.save
        redirect_to @blog, notice: 'Blog was successfully published.'
      else
        format.html { render :new }
      end
    elsif params[:commit]=="save"
      @blog.publish = false
      if @blog.save
        redirect_to @blog, notic:"Blog was successfully published."
      else
        render :new
      end
    end
  end
  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def blog_params
    params.require(:blog).permit(:title, :description, :tag)
  end
end
