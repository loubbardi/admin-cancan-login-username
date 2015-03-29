class UsersController < ApplicationController
load_and_authorize_resource  
	
skip_load_resource:only => :create  # probleme avec les strong parametre donc on skip load_resource pour l'action create


before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
	  authorize! :index, Ability
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
	params[:user][:role_ids] ||= []
	params[:user][:dossier_ids] ||= []
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
	
	#----Allows us to update the user without having to specify a new password and password confirmation
	if params[:user][:password].blank?
	   params[:user].delete(:password)
	   params[:user].delete(:password_confirmation)
	end
	
	  
	
    respond_to do |format|
      if @user.update(user_params)
	      sign_in(@user, :bypass => true) if @user == current_user
        format.html { redirect_to root_url, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      
       
      params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :username, {:role_ids => []}, {:dossier_ids => []}, )
    
    end

end
