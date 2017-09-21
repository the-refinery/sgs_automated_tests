require 'selenium-webdriver'

Given(/^I am not logged in$/) do
  @driver.navigate.to "https://www.sgstoolwizard.com/"
  expected_message = "You need to sign in or sign up before continuing."
  message = @driver.find_element(:class, 'notification').attribute('innerHTML')
  @driver.find_element(:class, 'logout').click if (message != expected_message)
  expect(message).to eq(expected_message)
end

Given(/^I am logged in$/) do
  @driver.navigate.to "https://www.sgstoolwizard.com/"
  expected_message = "You need to sign in or sign up before continuing."
  message = @driver.find_element(:class, 'notification').attribute('innerHTML')
  @driver.find_element(:class, 'logout').click if (message != expected_message)
  @driver.find_element(:name, 'user[email]').send_keys "sgs@example.com"
  @driver.find_element(:name, 'user[password]').send_keys "supersecret"
  @driver.find_element(:name, 'commit').click
  message = Selenium::WebDriver::Wait.new(:timeout => 5).until {
    @driver.find_element(:class, 'notification').attribute('innerHTML')
  }
  expect(message).not_to eq(expected_message)
end

When(/^I enter username "([^"]*)"$/) do |username|
  @driver.find_element(:name, 'user[email]').send_keys username
end

When(/^I enter password "([^"]*)"$/) do |password|
  @driver.find_element(:name, 'user[password]').send_keys password
end

Then(/^I should see the notification "([^"]*)"$/) do |notification|
  @driver.find_element(:name, 'commit').click
  message = Selenium::WebDriver::Wait.new(:timeout => 5).until {
    @driver.find_element(:class, 'notification').attribute('innerHTML')
  }
  expect(message).to eq(notification)
end