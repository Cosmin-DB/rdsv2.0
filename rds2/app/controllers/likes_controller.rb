class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]


  def like
    @like= Like.new()
		@like.user_id = current_user.id
		@like.publication_id = params[:id]
    @like.save
		reload
  end

  def dislike
		@dislike= Like.find_by user_id: current_user.id, publication_id: params[:id]
    @dislike.destroy
		reload
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

end
