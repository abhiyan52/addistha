class AddisthaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.addistha_mailer.newuser_confirmation.subject
  #
  def newuser_confirmation(user)
    @user = user 

    mail to: @user.email, subject: "Addistha account confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.addistha_mailer.bidcomplete.subject
  #
  def bidcomplete
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.addistha_mailer.purchase_confirmation.subject
  #
  def purchase_confirmation(advertisement_slot)
    @advertisement_slot = advertisement_slot
    mail to: @advertisement_slot.agent.email , subject: "Bid Successful"
  end
end
