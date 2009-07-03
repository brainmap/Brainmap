class StudyDescriptionsController < ApplicationController
  # GET /study_descriptions
  # GET /study_descriptions.xml
  def index
    @study_descriptions = StudyDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @study_descriptions }
    end
  end

  # GET /study_descriptions/1
  # GET /study_descriptions/1.xml
  def show
    @study_description = StudyDescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @study_description }
    end
  end

  # GET /study_descriptions/new
  # GET /study_descriptions/new.xml
  def new
    @study_description = StudyDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @study_description }
    end
  end

  # GET /study_descriptions/1/edit
  def edit
    @study_description = StudyDescription.find(params[:id])
  end

  # POST /study_descriptions
  # POST /study_descriptions.xml
  def create
    @study_description = StudyDescription.new(params[:study_description])

    respond_to do |format|
      if @study_description.save
        flash[:notice] = 'StudyDescription was successfully created.'
        format.html { redirect_to(@study_description) }
        format.xml  { render :xml => @study_description, :status => :created, :location => @study_description }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @study_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /study_descriptions/1
  # PUT /study_descriptions/1.xml
  def update
    @study_description = StudyDescription.find(params[:id])

    respond_to do |format|
      if @study_description.update_attributes(params[:study_description])
        flash[:notice] = 'StudyDescription was successfully updated.'
        format.html { redirect_to(@study_description) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @study_description.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /study_descriptions/1
  # DELETE /study_descriptions/1.xml
  def destroy
    @study_description = StudyDescription.find(params[:id])
    @study_description.destroy

    respond_to do |format|
      format.html { redirect_to(study_descriptions_url) }
      format.xml  { head :ok }
    end
  end
end
