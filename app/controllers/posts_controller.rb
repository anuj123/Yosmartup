#---
# Excerpted from "Advanced Rails Recipes",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/fr_arr for more book information.
#---

class PostsController < ApplicationController

  layout "application"
  before_filter :find_blog

  def index
  @posts = @blog.posts.find(:all)

  respond_to do |format|
    format.html # index.html.erb
    format.xml  { render :xml => @registrations }
  end
  end

  # other CRUD actions



  def show
  @post = @blog.posts.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
    format.xml  { render :xml => @post }
  end
  end

  def edit
  @post = @blog.posts.find(params[:id])
  end

  def destroy
  @post = @blog.registrations.find(params[:id])
  @post.destroy

  respond_to do |format|
    format.html { redirect_to(blog_posts_url(@blog)) }
    format.xml  { head :ok }
  end
  end



  def new
  @post = @blog.posts.new

  respond_to do |format|
    format.html # new.html.erb
    format.xml  { render :xml => @registration }
  end
  end



  def create
  @post = @blog.posts.new(params[:post])

  respond_to do |format|
    if @post.save
    flash[:notice] = 'Post was successfully created.'
    format.html { redirect_to([@blog, @post]) }
    format.xml  { render :xml => @post, 
               :status => :created, 
               :location => [ @blog, @post ] }
    else
    format.html { render :action => "new" }
    format.xml  { render :xml => @post.errors, 
               :status => :unprocessable_entity }
    end
  end
  end



  def update
  @blog = @post.registrations.find(params[:id])

  respond_to do |format|
    if @post.update_attributes(params[:post])
    flash[:notice] = 'Registration was successfully updated.'
    format.html { redirect_to([@blog, @post]) }
    format.xml  { head :ok }
    else
    format.html { render :action => "edit" }
    format.xml  { render :xml => @post.errors, 
               :status => :unprocessable_entity }
    end
  end


  end



private

  def find_blog
  @blog = Blog.find(params[:blog_id])
  end
end
