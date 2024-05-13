class PersonMailer < ApplicationMailer
    def reports_report(user)
      @user = user
      mail(to: @user.email, subject: 'Seu relatorio está aqui')
    end
  end