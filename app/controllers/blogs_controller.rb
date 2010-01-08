class BlogsController < ApplicationController
  # GET /events
  # GET /events.xml
 layout "application"
 
 
 
  def index
	@blogs = Blog.find(:all)

	respond_to do |format|
	  format.html # index.html.erb
	  format.xml  { render :xml => @events }
	end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
	@blog = Blog.find(params[:id])

	respond_to do |format|
	  format.html # show.html.erb
	  format.xml  { render :xml => @event }
	end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
	@blog = Blog.new

	respond_to do |format|
	  format.html # new.html.erb
	  format.xml  { render :xml => @event }
	end
  end

  # GET /events/1/edit
  def edit
	@blog = Blog.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
	@blog = Blog.new(params[:blog])

	respond_to do |format|
	  if @blog.save
		flash[:notice] = 'Blog was successfully created.'
		format.html { redirect_to(@blog) }
		format.xml  { render :xml => @blog, :status => :created, :location => @blog }
	  else
		format.html { render :action => "new" }
		format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
	@blog = Blog.find(params[:id])

	respond_to do |format|
	  if @blog.update_attributes(params[:blog])
		flash[:notice] = 'Event was successfully updated.'
		format.html { redirect_to(@blog) }
		format.xml  { head :ok }
	  else
		format.html { render :action => "edit" }
		format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
	  end
	end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
	@blog = Blog.find(params[:id])
	@blog.destroy

	respond_to do |format|
	  format.html { redirect_to(blogs_url) }
	  format.xml  { head :ok }
	end
  end
  
  
end
