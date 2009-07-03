class PersonnelGroupsController < ApplicationController
  # GET /personnel_groups
  # GET /personnel_groups.xml
  def index
    @personnel_groups = PersonnelGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @personnel_groups }
    end
  end

  # GET /personnel_groups/1
  # GET /personnel_groups/1.xml
  def show
    @personnel_group = PersonnelGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @personnel_group }
    end
  end

  # GET /personnel_groups/new
  # GET /personnel_groups/new.xml
  def new
    @personnel_group = PersonnelGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @personnel_group }
    end
  end

  # GET /personnel_groups/1/edit
  def edit
    @personnel_group = PersonnelGroup.find(params[:id])
  end

  # POST /personnel_groups
  # POST /personnel_groups.xml
  def create
    @personnel_group = PersonnelGroup.new(params[:personnel_group])

    respond_to do |format|
      if @personnel_group.save
        flash[:notice] = 'PersonnelGroup was successfully created.'
        format.html { redirect_to(@personnel_group) }
        format.xml  { render :xml => @personnel_group, :status => :created, :location => @personnel_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @personnel_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /personnel_groups/1
  # PUT /personnel_groups/1.xml
  def update
    @personnel_group = PersonnelGroup.find(params[:id])

    respond_to do |format|
      if @personnel_group.update_attributes(params[:personnel_group])
        flash[:notice] = 'PersonnelGroup was successfully updated.'
        format.html { redirect_to(@personnel_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @personnel_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /personnel_groups/1
  # DELETE /personnel_groups/1.xml
  def destroy
    @personnel_group = PersonnelGroup.find(params[:id])
    @personnel_group.destroy

    respond_to do |format|
      format.html { redirect_to(personnel_groups_url) }
      format.xml  { head :ok }
    end
  end
end
