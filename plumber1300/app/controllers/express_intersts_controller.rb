class ExpressInterstsController < ApplicationController
  # GET /express_intersts
  # GET /express_intersts.json
  def index
    @express_intersts = ExpressInterst.where("results=?", "P")

    @expressIntersts = Array.new(20)

    if @express_intersts
        expressCount = 0
        @express_intersts.each { |intersts|
          postcode = Postcode.find_by_postcode(intersts.postcode)
          if postcode.isAvailable == 1
            intersts.available = "Available"
          else
            intersts.available = "Not Available"
          end

          @expressIntersts[expressCount] = intersts
          expressCount = expressCount + 1
        }
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expressIntersts }
    end
  end

  # GET /express_intersts/1
  # GET /express_intersts/1.json
  def show
    @express_interst = ExpressInterst.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @express_interst }
    end
  end

  # GET /express_intersts/new
  # GET /express_intersts/new.json
  def new
    @express_interst = ExpressInterst.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @express_interst }
    end
  end

  # GET /express_intersts/1/edit
  def edit
    @express_interst = ExpressInterst.find(params[:id])
  end

  # POST /express_intersts
  # POST /express_intersts.json
  def create
    @express_interst = ExpressInterst.new(params[:express_interst])

    respond_to do |format|
      if @express_interst.save
        format.html { redirect_to @express_interst, notice: 'Express interst was successfully created.' }
        format.json { render json: @express_interst, status: :created, location: @express_interst }
      else
        format.html { render action: "new" }
        format.json { render json: @express_interst.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /express_intersts/1
  # PUT /express_intersts/1.json
  def update
    @express_interst = ExpressInterst.find(params[:id])

    respond_to do |format|
      if @express_interst.update_attributes(params[:express_interst])
        format.html { redirect_to @express_interst, notice: 'Express interst was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @express_interst.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /express_intersts/1
  # DELETE /express_intersts/1.json
  def destroy
    @express_interst = ExpressInterst.find(params[:id])
    @express_interst.destroy

    respond_to do |format|
      format.html { redirect_to express_intersts_url }
      format.json { head :no_content }
    end
  end

  def approve
    postcode = Postcode.find_by_postcode(params[:postcode])
    if postcode.isAvailable == 1
      postcode.availableLimit = postcode.availableLimit - 1
      if postcode.availableLimit == 0
        postcode.isAvailable = 0
      end
    end
    timeNow = Time.now
    postcodeList = PostcodeList.new
    postcodeList.postcode = postcode.postcode
    postcodeList.email = params[:email]
    postcodeList.createdDate = timeNow.localtime
    postcodeList.expiryDate = 1.years.from_now
    postcodeList.isSuspended = 0

    postcodeList.save
    postcode.save

    respond_to do |format|
      format.html { redirect_to @express_interst, notice: 'Express interst was successfully Accepted.' }
      format.json { render json: @express_interst, status: :created, location: @express_interst }
    end
    
  end

  def reject
  end
end
