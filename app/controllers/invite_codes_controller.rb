class InviteCodesController < ApplicationController
  before_filter :admin_only

  # GET /invite_codes
  # GET /invite_codes.xml
  def index
    @invite_codes = InviteCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invite_codes }
    end
  end

  # GET /invite_codes/1
  # GET /invite_codes/1.xml
  def show
    @invite_code = InviteCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invite_code }
    end
  end

  # GET /invite_codes/new
  # GET /invite_codes/new.xml
  def new
    @invite_code = InviteCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invite_code }
    end
  end

  # GET /invite_codes/1/edit
  def edit
    @invite_code = InviteCode.find(params[:id])
  end

  # POST /invite_codes
  # POST /invite_codes.xml
  def create
    @invite_code = InviteCode.new(params[:invite_code])

    respond_to do |format|
      if @invite_code.save
        format.html { redirect_to(@invite_code, :notice => 'Invite code was successfully created.') }
        format.xml  { render :xml => @invite_code, :status => :created, :location => @invite_code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invite_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invite_codes/1
  # PUT /invite_codes/1.xml
  def update
    @invite_code = InviteCode.find(params[:id])

    respond_to do |format|
      if @invite_code.update_attributes(params[:invite_code])
        format.html { redirect_to(@invite_code, :notice => 'Invite code was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invite_code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invite_codes/1
  # DELETE /invite_codes/1.xml
  def destroy
    @invite_code = InviteCode.find(params[:id])
    @invite_code.destroy

    respond_to do |format|
      format.html { redirect_to(invite_codes_url) }
      format.xml  { head :ok }
    end
  end

  def admin_only
    redirect_to root_path unless current_user.admin?
  end
end
