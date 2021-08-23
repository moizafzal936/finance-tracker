class Users::UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def friends
    #@friends = current_user.friends
    @q = current_user.friends.ransack(params[:q])
    @friends = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    if params[:friend].present?
     # @friends = User.search(params[:friend])
     
      @friends = params[:friend]
     
     # @friends = current_user.except_current_user(@friends)

      if @friends
        respond_to do |format|
          format.js { render partial: 'users/users/shared/friend_results' }
        end
      
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find user"
        end
        format.js { render partial: 'users/users/shared/friend_results' }
      end    
    
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a friend name or email to search"
        format.js { render partial: 'users/users/shared/friend_results' }
      end
    end
  end
end
