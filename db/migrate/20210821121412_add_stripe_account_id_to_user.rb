class AddStripeAccountIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :stripe_account_id, :string
  end
end
