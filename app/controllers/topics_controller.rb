class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    category=Category.find_by_is_default(true)
    @topic = Topic.new
    @topic.parent_id=params[:parent_id]
    @topic.category_id=category.id if category!=nil
    @topic.name=DateTime.now.to_formatted_s(:long)
    @topic.sort_order=0
    @topic.state_id=State.default_for(@topic.category).first.id


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to @topic.parent }
      format.json { head :no_content }
    end
  end
  
  def move
    parent_id=params[:parent_id]
      
    #if no topic id given, throw flash error
    if parent_id==""
      flash[:error]="Error moving topic to new parent topic: new parent topic id required"
      return redirect_to request.referer
    end
      
    #if topic not found, throw flash error
    begin
      @parent = Topic.find(parent_id)
    rescue
      flash[:error]="Topic with id #{params[:parent_id]} not found"
      return redirect_to request.referer
    end
        
    @topic = Topic.find(params[:id])
    @topic.update_attributes(parent_id:@parent.id)
    redirect_to request.referer
  end

  def add_new_comment
    topic = Topic.find(params[:id])
    topic.comments << Comment.new(params[:comment])
    redirect_to :action => :show, :id => topic
  end

end
