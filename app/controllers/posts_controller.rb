class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @title=@post.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    category=Category.find_by_is_default(true)
    @post = Post.new
    @post.topic_id=params[:topic_id]
    @post.category_id=category.id if category!=nil
    @post.name=DateTime.now.to_formatted_s(:long)
    @post.sort_order=0
    @post.state_id=State.default_for(@post.category).first.id
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to @post.topic }
      format.json { head :no_content }
    end
  end
  
  def move
    topic_id=params[:topic_id]
      
    #if no topic id given, throw flash error
    if topic_id==""
      flash[:error]="Error moving post to new topic: new topic id required"
      return redirect_to request.referer
    end
      
    #if topic not found, throw flash error
    begin
      @topic = Topic.find(topic_id)
    rescue
      flash[:error]="Topic with id #{params[:topic_id]} not found"
      return redirect_to request.referer
    end
        
    @post = Post.find(params[:id])
    @post.update_attributes(topic_id: @topic.id)
    redirect_to request.referer
  end

  def add_new_comment
    post = Post.find(params[:id])
    post.comments << Comment.new(params[:comment])
    redirect_to :action => :show, :id => post
  end
  
  def convert_to_topic
    post = Post.find(params[:id])

    topic=Topic.create(:name=>post.name, :parent_id=>post.topic_id, :category_id=>post.category_id, :content=>post.content, :sort_order=>post.sort_order)
    post.comments.each do |comment|
      comment.update_attributes(commentable_id: topic.id, commentable_type: "Topic")
    end  
    
    #a refresh is needed for the comments not to be deleted along with the post
    post = Post.find(params[:id])
    post.destroy
     
    redirect_to :controller => 'topics', :action => :show, :id => topic
    #redirect_to request.referer
  end
  
end
