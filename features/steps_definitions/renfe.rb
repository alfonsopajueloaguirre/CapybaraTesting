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
  sleep 3
  puts page.inspect
  page.has_content?('weeoeEGPD')
end

Given(/^I am on Renfe main page$/) do
  visit ('http://www.renfe.com/')
end

When(/^I click on Customer Help$/) do
  sleep 3
  click_link_or_button 'Atención al cliente'
end

Then(/^The browser opens the Costumer Help page$/) do
  sleep 3
  puts page.inspect
  page.find_by_id('colB')
end

When(/^I search for a travel from Madrid to Barcelona$/) do
  fill_in 'IdOrigen', :with => 'MADRID - ATOCHA CERCANIAS'
  fill_in 'IdDestino', :with => 'VALENCIA (TODAS)'
  click_button 'Comprar'
end

Then(/^The page returns me the results$/) do
  sleep 3
  puts page.inspect
  page.has_content?('SE HAN ENCONTRADO LOS SIGUIENTES ERRORES')
end

When(/I click on Welcome/) do
  click_on 'Welcome'
end

Then(/The english page is displayed$/) do
  sleep 3
  puts page.inspect
  page.has_content?('JOURNEY DATE')
end

When(/I click on Job appliances$/) do
  click_on 'OFERTA DE EMPLEO'
  sleep 3
end

Then(/I search for my desired job$/) do
  click_on 'Maquinista de Entrada'
  sleep 3
  page.has_content?('Convocatoria de puestos de Maquinista de Entrada para el Grupo Renfe')
end