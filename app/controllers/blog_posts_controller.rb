class BlogPostsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update, :destroy, :new, :create]
  before_action :set_admin
  before_action :get_all_blog_posts, only: [:index, :create]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]  
  # GET /blog_posts
  # GET /blog_posts.json
  def index
    @blog_posts = BlogPost.all
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.json
  def show
  end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @blog_post = BlogPost.create(blog_post_params)
    
      respond_to do |format|
        if @blog_post.valid?
          format.html { redirect_to @blog_post }
          format.js
        else
	  format.html { redirect_to :new }
	  format.js
	end
      end
  end

  # PATCH/PUT /blog_posts/1
  # PATCH/PUT /blog_posts/1.json
  def update
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to @blog_post, notice: 'Blog post was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_post }
	format.js
      else
        format.html { render :edit }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
	format.js
      end
    end
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    @blog_post.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  def cancel
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_post_params
      params[:blog_post].permit(:title, :post)
    end

    def get_all_blog_posts
      @blog_posts = BlogPost.all
    end

    def set_admin
      @admin = Admin.first
    end
end
