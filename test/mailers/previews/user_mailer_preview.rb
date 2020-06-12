class UserMailerPreview < ActionMailer::Preview
  def new_selling_range_email
    UserMailer.with(user: User.first).new_selling_range_email
  end
end
