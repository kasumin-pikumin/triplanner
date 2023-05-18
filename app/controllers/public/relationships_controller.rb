class Public::RelationshipsController < ApplicationController
before_action :authenticate_user!

  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    following.save
    redirect_to request.referrer || post_path(user_id)
    #↑ 以前のパスに戻る、見つからなければ
  end

  def destroy
    f create
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer || post_path(user_id)
  end

end
