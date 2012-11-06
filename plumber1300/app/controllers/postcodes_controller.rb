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
    sessionPostcodes = session[:cart_postcodes]
    logger.debug "SANJ BBB1 #{params['postcode']}"
    logger.debug "SANJ BBB2 #{session[:postcode]}"
    logger.debug " findpostcode Session POCTCODE #{session[:cart_postcodes]}"
    postcodeValue = 0
    if session[:postcode]  and !params['postcode']
      postcodeValue = session[:postcode]
      logger.debug "SANJ BBB3"
    else
      postcodeValue = params['postcode'] 
    end
    
    if params['postcode']
      logger.debug "SANJ BBB4"
      session[:postcode] = params['postcode'] 
    end

    logger.debug "SANJ BBB5 #{postcodeValue}"
    @postcodeSuburbs = PostcodeSuburb.find_by_postcode(postcodeValue)
    logger.debug "SANJ BBB6 #{postcodeValue}"
    if @postcodeSuburbs
      logger.debug "SANJ BBB7"
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
        if !sessionPostcodes or !sessionPostcodes.include? postcodeValue.to_s
          @postcodes[postcodeCount] = @postcode 
          postcodeCount = postcodeCount + 1   
        end

        if(@postcode.nearPostcodes)
          nearPostcodes = @postcode.nearPostcodes.split(",")
          nearPostcodes.each{ |p|
            if !sessionPostcodes or !sessionPostcodes.include? p
              @postcode = Postcode.find_by_postcode(p)
              if postcodeCount < 10
                @postcodes[postcodeCount] = @postcode
                postcodeCount = postcodeCount + 1     
              end
            end
          }
        end
      end
      logger.debug "SANJ BBB8"
      logger.debug "No postcode found #{postcodeValue}"
    end
    logger.debug "SANJ BBB9"
    @carts= Array.new(20)
    
    setupFee = 1
    lineItemIndex = 0
    @initSetup = 0
    @perMonth = 0
    logger.debug "SANJ BBB10 #{sessionPostcodes}"
    if sessionPostcodes
        sessionPostcodes.split(",").each { |spc|
          pc = Postcode.find_by_postcode(spc)
          logger.debug "SANJ BBB11 #{spc}"
          if pc
            cart = Cart.new
            cart.postcode = pc.postcode
            cart.email = session[:email]
            cart.price = pc.price
            @perMonth = @perMonth + pc.price
            if setupFee <= 2
              cart.cart_id = 500
              @initSetup = @initSetup  + 500
              setupFee = setupFee + 1
            else
              cart.cart_id = 250
              @initSetup = @initSetup  + 250
            end
            @carts[lineItemIndex] = cart
            logger.debug "SANJ BBB12 #{lineItemIndex}"
            lineItemIndex = lineItemIndex + 1
          end
        }
    end
  end
end
