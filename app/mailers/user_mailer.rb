class UserMailer < ApplicationMailer
    
    def welcome_email(email, token)
    @euser = email
    @token  = token
    mail(to: @euser, subject: 'Вход в социальную сеть Вики5')
    end
    
end
