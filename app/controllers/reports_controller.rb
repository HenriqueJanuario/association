  class ReportsController < ApplicationController
    def balance
      # Gere os dados do relatório
      @people = Person.order(:balance).pluck(:name, :balance)
  
      # Gere o arquivo CSV temporário
      csv_data = CSV.generate(headers: true) do |csv|
        csv << ['name', 'balance']
        @people.each do |person|
          csv << person
        end
      end
  
      # Anexe o arquivo CSV ao e-mail e envie
      PersonMailer.balance_report(csv_data).deliver_now
  
      redirect_to root_path, notice: 'Relatório de saldo enviado com sucesso!'
    end
  end
