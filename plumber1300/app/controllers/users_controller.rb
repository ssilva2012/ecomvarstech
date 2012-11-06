class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def newUser
    @user = User.new

    respond_to do |format|
      format.html  #newUser.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        if(params[:signup])
          session[:email] = @user.email
          UserMailer.registration_confirmation(@user).deliver
          if session[:cart_postcodes]
            logger.debug "Redirect1 to #{findPostcode_path}"
            format.html { redirect_to findPostcode_path, notice: 'User was successfully created.' }
            format.json { render json: @user, status: :created, location: @user }
          else 
            logger.debug "Redirect2 to #{static_pages_plumbersection_path}"
            redirect_to static_pages_plumbersection_url
            format.html { redirect_to static_pages_plumbersection_url, notice: 'User was successfully created.' }
            format.json { render json: @user, status: :created, location: @user }
          end
        else
          logger.debug "Redirect3"
          format.html { redirect_to admin_user_url, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        end
      else
        logger.debug "Redirect4"
        if(params[:signup])
          format.html { render action: "newUser" }
        else
          format.html { render action: "new" }
        end
        logger.debug "Redirect56"
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def signUp
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:email] = @user.email
        format.html { redirect_to postcodes_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "newUser" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def signIn
    @user = User.find_by_email(params[:email])

    respond_to do |format|
      if @user.save
        format.html { redirect_to postcodes_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "newUser" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_user_url, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_user_url }
      format.json { head :no_content }
    end
  end
end
