class PeopleController < ApplicationController
  before_filter :set_active_tab
   before_filter :login_required, :except => [ :show, :index, :research_objectives, :collaborators ]
   
  def set_active_tab
    @active_nav_tab = 'about-tab'
  end
  
  # GET /people/collaborators
  # GET /people/collborators.xml
  def collaborators
    @collabs = Person.in_group('Collaborators')
    respond_to do |format|
      format.html # collaborators.html.erb
      format.xml  { render :xml => @collabs }
    end
  end
  
  # GET /people
  # GET /people.xml
  def index
    @people = Person.all
    @scientists = Person.in_group('Scientists')
    @staff = Person.in_group('Research Staff')
    @grads = Person.in_group('Graduate Students')
    @studs = Person.in_group('Research Assistants')
    @alumni = Person.in_group('Alumni')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /people/1
  # GET /people/1.xml
  def show
    @people = Person.all
    @scientists = Person.in_group('Scientists')
    @staff = Person.in_group('Research Staff')
    @grads = Person.in_group('Graduate Students')
    @studs = Person.in_group('Research Assistants')
    @collabs = Person.in_group('Collaborators')
    @alumni = Person.in_group('Alumni')

    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    @person = Person.new
    @person.build_address

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.xml
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        flash[:notice] = 'Person was successfully created.'
        format.html { redirect_to(@person) }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        flash[:notice] = 'Person was successfully updated.'
        format.html { redirect_to(@person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.xml  { head :ok }
    end
  end
end
