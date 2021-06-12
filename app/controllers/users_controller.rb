class UsersController < ApiController
    before_action :authorized, only: [:auto_login]

  def index
    @users = User.all
    render json: @users, status: 200
  end

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: 200
    else
      render json: {error: @user.errors.full_messages.join("; ")}, status: 401
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      head 200
    else
      head 404
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])
    if @user
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid email or password"}
      end
    else
      user_id = JWT.decode(params[:headers][:Authorization],
                Rails.application.secret_key_base, true, algorithm: 'HS256')[0]['user_id']
      @user = User.find(user_id)
      if @user
        token = encode_token({user_id: @user.id})
        render json: {user: @user}, status: 200
      else
        render json: {error: "Invalid token"}, status: 401
      end
  end
  end

  private

  def user_params
    params.permit(:email, :firstname, :lastname, :is_admin, :password, :token)
  end
end
