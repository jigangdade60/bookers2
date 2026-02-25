class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create] 
  before_action :set_user, only: [:show, :edit, :update]  
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # ユーザー登録成功後、ログイン画面へリダイレクト
      start_new_session_for @user
      redirect_to user_path(@user), notice: "Welcome! You have signed up successfully."
    else
      # エラー時はフォームを再表示
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # name, email_address, password, password_confirmation を許可
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation,:introduction, :profile_image)
  end
  def set_user
    @user = User.find(params[:id])
  end
  def ensure_correct_user
    unless @user.id == Current.user.id
      redirect_to user_path(Current.user.id)
    end
  end
end
