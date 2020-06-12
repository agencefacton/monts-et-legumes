class UserMailer < ApplicationMailer
  def new_selling_range_email
    @user = params[:user]
    mail(to: @user.email, subject: 'La vente est ouverte')
  end
end
