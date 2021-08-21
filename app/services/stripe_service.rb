class StripeService

  def self.create_account(user, refresh_url, return_url)
    account = Stripe::Account.create(
      type: 'express',
      email: user.email,
      country: 'US',
      capabilities: {
        card_payments: {requested: true},
        transfers: {requested: true},
      },
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
    link = Stripe::AccountLink.create({
                                        account: account.id,
                                        refresh_url: 'https://localhost:3000',
                                        return_url: 'https://localhost:3000',
                                        type: 'account_onboarding',
                                      })

    OpenStruct.new(success: true, url: link.url)
  rescue StandardError
    OpenStruct.new(success: false, errors: 'OOps something is wrong please try again')
  end
end