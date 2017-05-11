class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]

  def share
    @share = Share.new()
		@share.user_id = current_user.id
		@share.publication_id = params[:id]
    @share.save
		reload
  end
  def unshare
		@unshare= Share.find_by user_id: current_user.id, publication_id: params[:id]
    @unshare.destroy
		reload
  end

  # DELETE /shares/1
  # DELETE /shares/1.json
  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to shares_url, notice: 'Share was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
      @share = Share.find(params[:id])
    end
end
