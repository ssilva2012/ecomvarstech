class PostcodesController < ApplicationController
  # GET /postcodes
  # GET /postcodes.json
  def index
    @postcodes = Postcode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @postcodes }
    end
  end

  # GET /postcodes/1
  # GET /postcodes/1.json
  def show
    @postcode = Postcode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: admin_postcode_url }
    end
  end

  # GET /postcodes/new
  # GET /postcodes/new.json
  def new
    @postcode = Postcode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: admin_postcode_url }
    end
  end

  # GET /postcodes/1/edit
  def edit
    @postcode = Postcode.find(params[:id])
  end

  # POST /postcodes
  # POST /postcodes.json
  def create
    @postcode = Postcode.new(params[:postcode])

    respond_to do |format|
      if @postcode.save
        format.html { redirect_to admin_postcode_url, notice: 'Postcode was successfully created.' }
        format.json { render json: admin_postcode_url, status: :created, location: postcodes_url }
      else
        format.html { render action: "new" }
        format.json { render json: @postcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /postcodes/1
  # PUT /postcodes/1.json
  def update
    @postcode = Postcode.find(params[:id])

    respond_to do |format|
      if @postcode.update_attributes(params[:postcode])
        format.html { redirect_to admin_postcode_url, notice: 'Postcode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @postcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postcodes/1
  # DELETE /postcodes/1.json
  def destroy
    @postcode = Postcode.find(params[:id])
    @postcode.destroy

    respond_to do |format|
      format.html { redirect_to admin_postcode_url }
      format.json { head :no_content }
    end
  end


  def findpostcode
    @postcodeSuburbs = PostcodeSuburb.find_by_postcode(params['postcode'])
    if @postcodeSuburbs
      postcodeValue = 0
      if @postcodeSuburbs.kind_of? (Array)
        postcodeValue = @postcodeSuburbs[0].postcode
      else
        postcodeValue = @postcodeSuburbs.postcode
      end
      logger.debug "near by postcode #{postcodeValue}"
      @postcode = Postcode.find_by_postcode(postcodeValue)
      @postcodes= Array.new(10)
      postcodeCount = 0;

      if(@postcode)
        @postcodes[postcodeCount] = @postcode  
        postcodeCount = postcodeCount + 1   

        if(@postcode.nearPostcodes)
          nearPostcodes = @postcode.nearPostcodes.split(",")
          nearPostcodes.each{ |p|
            @postcode = Postcode.find_by_postcode(p)
            if postcodeCount < 10
              @postcodes[postcodeCount] = @postcode
              postcodeCount = postcodeCount + 1     
            end
          }
        end

        #respond_to do |format|
          #render :layout => 'postcodecart'
          #format.html { redirect_to postcode_cart_index_path}
          #format.json { render json: @postcodes }
        #end

      else
        respond_to do |format|
          format.html { redirect_to plumber_home_path }
        end

      end

    end

  end

end
