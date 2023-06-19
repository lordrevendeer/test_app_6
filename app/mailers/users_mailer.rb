class UsersMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.users_mailer.reminder_notification.subject
  #
  def reminder_notification(email)

    mail to: email, subject: 'Reminder to complete your habits today!'
  end
end
