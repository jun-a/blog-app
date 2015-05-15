class PostsController < ApplicationController
  
  before_action :require_login!, except: [:index, :show]
  before_filter :willpost_content? #, :only => [:edit, :destroy] ここはこれでいいのか？
  
  #http_basic_authenticate_with name: "dhh", password: "secret", execpt: [:index, :show] #一時的な土台としてつくる
  #willpostが有効かどうかで記事の分類を行って、そこから有効なもの(日時が経過しているもの)のみindexとshowで@postに入れる
  

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    if @post.category
      @category_name = @post.category.name
    end
    
    if @post.tag
        @tag_name = @post.tag.name
    end 

    if content.willpost != Time.now
       redirect_to 'posts'
    end 
  end

  def new
    @post = Post.new
    generate_category_list
    generate_tag_list
  end

  def create
    @post = Post.new(post_params)
    @post.save
    willpost_content?(@post.post_date)
    redirect_to 'posts'
  end

  def edit
    @post = Post.find(params[:id])
    generate_category_list
    generate_tag_list
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  end


  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

 
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def generate_category_list
    @categories = Category.find(:all, :order => "name")
  end

  def generate_tag_list
    @tags = Tag.find(:all, :order => "name")
  end



=begin
  #userのlogin条件設定
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end
=end
end
