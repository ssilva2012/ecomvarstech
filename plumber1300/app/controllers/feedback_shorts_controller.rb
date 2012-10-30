class FeedbackShortsController < ApplicationController
  # GET /feedback_shorts
  # GET /feedback_shorts.json
  def index
    @feedback_shorts = FeedbackShort.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedback_shorts }
    end
  end

  # GET /feedback_shorts/1
  # GET /feedback_shorts/1.json
  def show
    @feedback_short = FeedbackShort.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback_short }
    end
  end

  # GET /feedback_shorts/new
  # GET /feedback_shorts/new.json
  def new
    @feedback_short = FeedbackShort.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback_short }
    end
  end

  # GET /feedback_shorts/1/edit
  def edit
    @feedback_short = FeedbackShort.find(params[:id])
  end

  # POST /feedback_shorts
  # POST /feedback_shorts.json
  def create
    @feedback_short = FeedbackShort.new(params[:feedback_short])
    UserMailer.customer_feedback(@feedback_short).deliver
    respond_to do |format|
      if @feedback_short.save
        format.html { redirect_to home_path, notice: 'Feedback short was successfully created.' }
        format.json { render json: home_path, status: :created, location: @feedback_short }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback_short.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedback_shorts/1
  # PUT /feedback_shorts/1.json
  def update
    @feedback_short = FeedbackShort.find(params[:id])

    respond_to do |format|
      if @feedback_short.update_attributes(params[:feedback_short])
        format.html { redirect_to @feedback_short, notice: 'Feedback short was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback_short.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_shorts/1
  # DELETE /feedback_shorts/1.json
  def destroy
    @feedback_short = FeedbackShort.find(params[:id])
    @feedback_short.destroy

    respond_to do |format|
      format.html { redirect_to feedback_shorts_url }
      format.json { head :no_content }
    end
  end
end
