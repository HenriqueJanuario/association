# Este arquivo deve garantir a existência dos registros necessários para executar o aplicativo em todos os ambientes 
# (produção, desenvolvimento, teste). O código aqui deve ser idempotente para que possa ser executado em qualquer ponto
# em qualquer ambiente. Os dados podem ser carregados com o comando bin/rails db:seed (ou criados junto com o banco de dados com db:setup).

puts "Destroying existing records..."
# Descomente as linhas abaixo se você quiser limpar o banco de dados antes de popular novamente
# User.destroy_all
Debt.destroy_all
Person.destroy_all
Payment.destroy_all

# Criação de um usuário administrador
# User.create email: 'admin@admin.com', password: '111111'

# puts "Usuário criado:"
# puts "login admin@admin.com"
# puts "senha 111111"

# Criação de múltiplos usuários
# 10000.times do |counter|
#   puts "Creating user #{counter}"
#   User.create email: Faker::Internet.email, password: '111111'
# end

1000000.times do |counter|
  puts "Inserting Person #{counter}"

  attrs = {
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    national_id: CPF.generate,
    active: [true, false].sample,
    user: User.order('RAND()').first
  }
  person = Person.create(attrs)

  if person.persisted?
    5.times do |debt_counter|
      puts "Inserting Debt #{debt_counter}"
      person.debts.create(
        amount: Faker::Number.between(from: 1, to: 10000),
        observation: Faker::Lorem.paragraph
      )
      person.payments.create(
        amount: Faker::Number.between(from: 1, to: 5000),
        observation: Faker::Lorem.paragraph
      )
    end
  else
    puts "Failed to save Person #{counter}"
  end
end
