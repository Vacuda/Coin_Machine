class Admin < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

    before_save :downcase_email

    def self.all_emails
        #get all admins
        all_admins = Admin.all()

        #get all emails
        admin_emails = []
        all_admins.each do |email|
            admin_emails.push(email.email)
        end
    
        return admin_emails
    end


    private
        def downcase_email
            self.email.downcase!
        end




end
