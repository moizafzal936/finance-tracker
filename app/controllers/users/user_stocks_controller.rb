class Users::UserStocksController < ApplicationController

  def create
    stock = Stock.check_db(params[:ticker])
    
    if stock.blank? 
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
   
    flash[:notice] = "Stock #{stock.name} Successfully added to your Portfolio"
    redirect_to portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user, stock_id: stock.id).first
    user_stock.destroy
    flash[:notice] = "#{stock.ticker} Successfully Deleted from Porfolio" 
    redirect_to portfolio_path
  end
end
