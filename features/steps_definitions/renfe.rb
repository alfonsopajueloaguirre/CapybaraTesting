require 'capybara/dsl'
include Capybara::DSL

Given(/^I am on Renfe login page$/) do
  visit ('https://venta.renfe.com/vol/login.do?Idioma=es&Pais=ES&inirenfe=SI')
end

When(/^I log as admin$/) do
  fill_in 'txtoUsuario', :with => 'admin'
  fill_in 'txtoPass', :with => 'admin'
  click_button 'login-button'

end

Then(/^The login fails$/) do
  puts page.inspect
  expect(page).to have_content('Usuario o contraseña incorrectos (U005)')
end

Given(/^I am on Renfe main page$/) do
  visit ('http://www.renfe.com/')
end

When(/^I click on Customer Help$/) do
    click_link_or_button 'Atención al cliente'
end

Then(/^The browser opens the Costumer Help page$/) do
  puts page.inspect
  expect(page).to have_css("input", :between => 1..5)

end

When(/^I search for a travel from Madrid to Barcelona$/) do
  fill_in 'IdOrigen', :with => 'MADRID - ATOCHA CERCANIAS'
  fill_in 'IdDestino', :with => 'VALENCIA (TODAS)'
  click_button 'Comprar'
end

Then(/^The page returns me the results$/) do
  puts page.inspect
  expect(page).to have_content('SE HAN ENCONTRADO LOS SIGUIENTES ERRORES')
end

When(/I click on special offers$/) do
  click_on 'OFERTAS'
end

Then(/The offers are displayed$/) do
  puts page.inspect
  expect(page).to have_content('Bienvenido a Renfe Viajes')
end

When(/I click on Job applances$/) do
  click_on 'OFERTA DE EMPLEO'
end

Then(/I search for my desired job$/) do
  click_on 'Maquinista de Entrada'
  expect(page).to have_content('Convocatoria de puestos de Maquinista de Entrada para el Grupo Renfe')
end