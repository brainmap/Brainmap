class JobAdvertisementsController < ApplicationController
  before_filter :set_active_tab
  
  def set_active_tab
    @active_nav_tab = 'opportunities-tab'
  end
  
  # GET /job_advertisements
  # GET /job_advertisements.xml
  def index
    @job_advertisements = JobAdvertisement.all
    @volunteer_ad = JobAdvertisement.find_by_title('Volunteer for a study!')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_advertisements }
    end
  end

  # GET /job_advertisements/1
  # GET /job_advertisements/1.xml
  def show
    @job_advertisement = JobAdvertisement.find(params[:id])
    @opportunities = JobAdvertisement.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_advertisement }
    end
  end

  # GET /job_advertisements/new
  # GET /job_advertisements/new.xml
  def new
    @job_advertisement = JobAdvertisement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_advertisement }
    end
  end

  # GET /job_advertisements/1/edit
  def edit
    @job_advertisement = JobAdvertisement.find(params[:id])
  end

  # POST /job_advertisements
  # POST /job_advertisements.xml
  def create
    @job_advertisement = JobAdvertisement.new(params[:job_advertisement])

    respond_to do |format|
      if @job_advertisement.save
        flash[:notice] = 'JobAdvertisement was successfully created.'
        format.html { redirect_to(opportunities_path(@job_advertisement.opp_type)) }
        format.xml  { render :xml => @job_advertisement, :status => :created, :location => @job_advertisement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_advertisement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_advertisements/1
  # PUT /job_advertisements/1.xml
  def update
    @job_advertisement = JobAdvertisement.find(params[:id])

    respond_to do |format|
      if @job_advertisement.update_attributes(params[:job_advertisement])
        flash[:notice] = 'JobAdvertisement was successfully updated.'
        format.html { redirect_to(@job_advertisement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_advertisement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_advertisements/1
  # DELETE /job_advertisements/1.xml
  def destroy
    @job_advertisement = JobAdvertisement.find(params[:id])
    @job_advertisement.destroy

    respond_to do |format|
      format.html { redirect_to(job_advertisements_url) }
      format.xml  { head :ok }
    end
  end
end
