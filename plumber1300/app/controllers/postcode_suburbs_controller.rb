class PostcodeSuburbsController < ApplicationController
  # GET /postcode_suburbs
  # GET /postcode_suburbs.json
  def index
    @postcode_suburbs = PostcodeSuburb.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @postcode_suburbs }
    end
  end

  # GET /postcode_suburbs/1
  # GET /postcode_suburbs/1.json
  def show
    @postcode_suburb = PostcodeSuburb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: admin_postcodesuburbs_url }
    end
  end

  # GET /postcode_suburbs/new
  # GET /postcode_suburbs/new.json
  def new
    @postcode_suburb = PostcodeSuburb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: admin_postcodesuburbs_url }
    end
  end

  # GET /postcode_suburbs/1/edit
  def edit
    @postcode_suburb = PostcodeSuburb.find(params[:id])
  end

  # POST /postcode_suburbs
  # POST /postcode_suburbs.json
  def create
    @postcode_suburb = PostcodeSuburb.new(params[:postcode_suburb])

    respond_to do |format|
      if @postcode_suburb.save
        format.html { redirect_to admin_postcodesuburbs_url, notice: 'Postcode suburb was successfully created.' }
        format.json { render json: admin_postcodesuburbs_url, status: :created, location: @postcode_suburb }
      else
        format.html { render action: "new" }
        format.json { render json: @postcode_suburb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /postcode_suburbs/1
  # PUT /postcode_suburbs/1.json
  def update
    @postcode_suburb = PostcodeSuburb.find(params[:id])

    respond_to do |format|
      if @postcode_suburb.update_attributes(params[:postcode_suburb])
        format.html { redirect_to admin_postcodesuburbs_url, notice: 'Postcode suburb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @postcode_suburb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postcode_suburbs/1
  # DELETE /postcode_suburbs/1.json
  def destroy
    @postcode_suburb = PostcodeSuburb.find(params[:id])
    @postcode_suburb.destroy

    respond_to do |format|
      format.html { redirect_to admin_postcodesuburbs_url }
      format.json { head :no_content }
    end
  end
end
