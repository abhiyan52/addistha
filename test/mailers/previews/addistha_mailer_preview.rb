# Preview all emails at http://localhost:3000/rails/mailers/addistha_mailer
class AddisthaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/addistha_mailer/newuser_confirmation
  def newuser_confirmation
    user = User.last 
    AddisthaMailer.newuser_confirmation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/addistha_mailer/bidcomplete
  def bidcomplete
    AddisthaMailer.bidcomplete
  end

  # Preview this email at http://localhost:3000/rails/mailers/addistha_mailer/purchase_confirmation
  def purchase_confirmation
    AddisthaMailer.purchase_confirmation
  end

end
