# Preview all emails at http://localhost:3000/rails/mailers/users_mailer
class UsersMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/users_mailer/reminder_notification
  def reminder_notification
    UsersMailer.reminder_notification
  end

end
