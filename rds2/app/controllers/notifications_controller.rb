class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index

			@notifications=  Notification.where(receiver_id: current_user.id)

  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
		if !params[:id].nil?
			  @notification = Notification.new
		else
				render :file => "#{Rails.root}/public/404.html",  :status => 404
		end

  end


  # POST /notifications
  # POST /notifications.json
  def create

    @notification = Notification.new(notification_params)
		@notification.user_id = current_user.id
		@notification.type_notification = params[:notification][:type_notification]
		@notification.receiver_id= params[:notification][:receiver_id]

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:receiver_id,:text, :type_notification, :user_id)
    end
end
