class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(
      name: params[:user][:name],
      dob: params[:user][:dob],
      email: params[:user][:email],
      phone_number: params[:user][:phone_number],
      address: params[:user][:address]
    )

    if @user.save
      redirect_to @user, notice: "User Created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH /users/:id
  def update
    @user = User.find(params[:id])

    if @user.update(
      name: params[:user][:name],
      dob: params[:user][:dob],
      email: params[:user][:email],
      phone_number: params[:user][:phone_number],
      address: params[:user][:address]
    )
      redirect_to @user, notice: "User Updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, notice: "User Deleted!"
  end
end
