class PostsController < ApplicationController
  before_action :authenticate_admin!, only: [:drafts, :edit, :update, :destroy, :new, :create]
  before_action :set_admin
  before_action :get_posts, only: [:new, :create, :update]
  before_action :set_post, only: [:show, :edit, :update, :destroy]  
  
  def index
    if params[:tag]
      get_tagged_posts
    else
      get_posts
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.create(post_params)
    
      respond_to do |format|
        if @post.valid?
          format.html { redirect_to @post }
          format.js
        else
	  format.html { redirect_to :new }
	  format.js
	end
      end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
	format.js
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
	format.js
      end
    end
  end
  
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  def drafts
    get_drafts
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params[:post].permit(:title, :content, :all_tags, :published, :image)
    end

    def get_posts
      @posts = Post.published.order(updated_at: :desc)
    end
 
    def get_drafts
      @posts = Post.drafts.order(updated_at: :desc)
    end

    def set_admin
      Admin.set_admin
    end

    def get_tagged_posts
      @posts = Post.published.tagged_with(params[:tag])
    end
end
