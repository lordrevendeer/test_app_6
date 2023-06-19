namespace :hello_world do

    # EXAMPLE: rake enable_auto_match_feature:enable_for_all_programs DOMAIN="chronus.com" SUBDOMAIN="amazon-mentoring"
    desc "enable auto match feature to all programs in a organization"
    task enable_for_all_programs: :environment do
        User.all.each do |user|
            UsersMailer.reminder_notification(user.email).deliver_now
        end
    end
end