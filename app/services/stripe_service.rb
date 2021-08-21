class StripeService

  def self.create_account(user, refresh_url, return_url)
    account = Stripe::Account.create(
      type: 'express',
      email: user.email,
      settings: {
        payouts: {
          schedule: {
            interval: "manual"
          }
        }
      },
      business_type: 'individual',
      business_profile: {
        product_description: "Host Paid Events for Other Travelers via Neesh"
      }
    )
    user.update(stripe_account_id: account.id)
    OpenStruct.new(success: true)
  rescue StandardError
    OpenStruct.new(success: false, errors: 'OOps something is wrong please try again')
  end
end