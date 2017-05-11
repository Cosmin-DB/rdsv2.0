class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
		sql = "SELECT  users.*
						FROM rds2_development.users
						INNER JOIN rds2_development.friends ON rds2_development.users.id = rds2_development.friends.friend_id
						WHERE rds2_development.friends.user_id=#{current_user.id};"
		@friends2=User.find_by_sql(sql)
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    friend = Friend.new(friend_params)
#    friend.user_id=params[]
#    friend.friend_id
    friend.save
     Notification.where("(user_id= ? OR user_id=?)
    AND 
    (receiver_id=? OR receiver_id=? )
    AND type_notification='friendship_request'",friend.user_id,friend.friend_id,friend.friend_id,friend.user_id).destroy_all
    
    
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend=Friend.where("user_id = ? AND friend_id=?",params[:user_id],params[:friend_id]).destroy_all
    reload

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend=Friend.where("user_id = params[:user_id] AND friend_id=params[:friend_id]")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.permit(:user_id, :friend_id)
    end
end
