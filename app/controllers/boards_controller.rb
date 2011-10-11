class BoardsController < ApplicationController
  before_filter :get_token, :only => :index
  before_filter :import_projects, :only => :index

  # GET /boards
  # GET /boards.xml
  def index
    if user_signed_in?
      if current_user.board.token
        if current_user.board.projects.any?
          redirect_to current_user.board.projects.first
        else
          render 'no_projects'
        end
      else
        render 'no_token'
      end
    else
      redirect_to new_user_registration_path, :notice => notice, :alert => alert
    end
  end

  # GET /boards/1
  # GET /boards/1.xml
  def show
    @board = Board.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @board }
    end
  end

  # GET /boards/new
  # GET /boards/new.xml
  def new
    @board = Board.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @board }
    end
  end

  # GET /boards/1/edit
  def edit
    @board = Board.find(params[:id])
  end

  # POST /boards
  # POST /boards.xml
  def create
    @board = Board.new(:token => token)

    respond_to do |format|
      if @board.save
        format.html { redirect_to(@board.projects.first, :notice => 'Board was successfully created.') }
        format.xml  { render :xml => @board, :status => :created, :location => @board }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @board.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boards/1
  # PUT /boards/1.xml
  def update
    @board = Board.find(params[:id])

    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to(@board, :notice => 'Board was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @board.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.xml
  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    respond_to do |format|
      format.html { redirect_to(boards_url) }
      format.xml  { head :ok }
    end
  end

  def refresh
    @board.projects.each do |project|
      project.import_stories
    end

    redirect_to @board.projects.first
  end

private

  def get_token
    if current_user && !current_user.board.token
      p "no token!"
      current_user.board.get_token
    end
  end

  def import_projects
    if current_user && current_user.board.token && current_user.board.projects.blank?
      p "no projects!"
      current_user.board.import_projects
    end
  end
end
