class AccountsController < ApplicationController

  def create_account
    response = StripeService.create_account(current_user, captain_account_path, root_path)
    if response.success
      redirect_to response.url
    else
      flash[:error] = 'Account Successfully connected'
      redirect_to root_path
    end
  end
end