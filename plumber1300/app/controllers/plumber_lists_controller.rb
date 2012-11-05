class PlumberListsController < ApplicationController
  # GET /plumber_lists
  # GET /plumber_lists.json
  def index
    @plumber_lists = PlumberList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plumber_lists }
    end
  end

  # GET /plumber_lists/1
  # GET /plumber_lists/1.json
  def show
    @plumber_list = PlumberList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plumber_list }
    end
  end

  # GET /plumber_lists/new
  # GET /plumber_lists/new.json
  def new
    @plumber_list = PlumberList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plumber_list }
    end
  end

  # GET /plumber_lists/1/edit
  def edit
    @plumber_list = PlumberList.find(params[:id])
  end

  # POST /plumber_lists
  # POST /plumber_lists.json
  def create
    @plumber_list = PlumberList.new(params[:plumber_list])

    respond_to do |format|
      if @plumber_list.save
        format.html { redirect_to @plumber_list, notice: 'Plumber list was successfully created.' }
        format.json { render json: @plumber_list, status: :created, location: @plumber_list }
      else
        format.html { render action: "new" }
        format.json { render json: @plumber_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plumber_lists/1
  # PUT /plumber_lists/1.json
  def update
    @plumber_list = PlumberList.find(params[:id])

    respond_to do |format|
      if @plumber_list.update_attributes(params[:plumber_list])
        format.html { redirect_to @plumber_list, notice: 'Plumber list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plumber_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plumber_lists/1
  # DELETE /plumber_lists/1.json
  def destroy
    @plumber_list = PlumberList.find(params[:id])
    @plumber_list.destroy

    respond_to do |format|
      format.html { redirect_to plumber_lists_url }
      format.json { head :no_content }
    end
  end
end
