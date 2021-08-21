class AccountsController < ApplicationController

  def create_account
    response = StripeService.create_account(current_user, captain_account_path, root_path)
    if response.success
      flash[:success] = 'Account Successfully connected'
      redirect_to root_path
    else
      flash[:error] = 'Account Successfully connected'
      redirect_to root_path
    end
  end
end