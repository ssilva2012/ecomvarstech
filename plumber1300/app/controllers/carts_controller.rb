class CartsController < ApplicationController
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end

  def addCartItem
    session[:postcode] = params["pc"]
    cartpostcodes = session[:cart_postcodes] 
    logger.debug " addCartItem 1 Session POCTCODE #{session[:cart_postcodes]}"
    if !cartpostcodes
      cartpostcodes = ""
    end
    cartpostcodes =cartpostcodes + "," + params["pc"]
    session[:cart_postcodes] = cartpostcodes
    logger.debug " addCartItem 2 Session POCTCODE #{session[:cart_postcodes]}"
    respond_to do |format|
      format.html { redirect_to findPostcode_path, notice: 'Cart was successfully created.' }
      format.json { render json: @cart, status: :created, location: @cart }
    end
  end

  def removeCartItem
    cartpostcodes = session[:cart_postcodes] 
    session[:postcode] = params["pc"]
    if cartpostcodes
      cartpostcodes[params["pc"]] = ''
      session[:cart_postcodes] = cartpostcodes
    end   
    logger.debug " removeCartItem Session POCTCODE #{session[:cart_postcodes]}"
    respond_to do |format|
      format.html { redirect_to findPostcode_path, notice: 'Cart was successfully created.' }
      format.json { render json: @cart, status: :created, location: @cart }
    end
  end

  def submitCart
    if session[:cart_postcodes] and session[:email]
      logger.debug "Submit cart Dome 3"
      cartpostcodes = session[:cart_postcodes] 
      cartpostcodes.split(",").each { |epc|
        if epc and epc != ""
          postcodeInt = ExpressInterst.new
          postcodeInt.email = session[:email]
          postcodeInt.postcode = epc
          postcodeInt.results = "P"

          postcodeInt.save
        end
      }
      @user = User.find_by_email(session[:email])
      session[:cart_postcodes] = nil
      UserMailer.express_intrest(@user, session[:cart_postcodes]).deliver
      UserMailer.intrest_plumber(@user, session[:cart_postcodes]).deliver
      respond_to do |format|
        format.html { redirect_to plumber_home_path, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      end
    else
      session[:waiting] = "Y"
      respond_to do |format|
        format.html { redirect_to login_path, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      end
    end
  end
end
