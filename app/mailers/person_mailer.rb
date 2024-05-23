class PersonMailer < ApplicationMailer
  def reports_report(user)
    @user = user

    attachments['balance_report.csv'] = {
      mime_type: 'text/csv',
      content: csv_data
    }

    mail(to: @user.email, subject: 'Relatório de Saldo')
  end
end