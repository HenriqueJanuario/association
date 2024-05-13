class ReportsController < ApplicationController
    def balance
      PersonMailer.reports_report(current_user).deliver_now
      redirect_to root_path, notice: 'Relatório de saldo enviado com sucesso!'
    end
  end