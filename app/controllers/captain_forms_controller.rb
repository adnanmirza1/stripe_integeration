class CaptainFormsController < ApplicationController

  def new
    @hostel_captain_request = CaptainForm.new
  end

  def create
    if current_user.stripe_account_id.present?
      @hostel_captain_request = CaptainForm.new(captain_form_params)
      @hostel_captain_request.user = current_user
      if @hostel_captain_request.save
        flash[:success] = 'Your request is being sent.You will get response shortly.'
        redirect_to root_path
      else
        render :new
      end
    else
      flash[:error] = 'You first need to connect your account'
      redirect_to new_captain_form_path
    end
  end


  private

  def captain_form_params
    params.require(:captain_form).permit(:image, :detail)
  end
end