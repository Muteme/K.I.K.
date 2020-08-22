require 'rubygems'
require 'watir'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'bench'

class Creator
  attr_accessor :browser, :firsts, :seconds
  def initialize
    @first = ["boat", "jimmy", "prison", "cheese", "gypsy", "" "french",
      "fry", "jingle", "penguin", "mexican", "canadian","italian",
       "spanish", "american", "australian", "belgian", "brazilian",
        "russian", "german", "grape"]
    @second = ["cowboy", "dingo", "dog", "cat", "apple", "watermelon",
      "banana", "peach", "pear", "hotsauce", "lemon", "jackal", "milktank",
       "clown", "spy", "burger", "frenchfry", "washboard", "bball",
        "prince", "princess", "queen", "king" "folgers"]

  end

  def create
    number = rand(0..9999).to_s
    password = "redditbot123"
    email = "dobato@getnada.com"
    username = @first.shuffle[0] + @second.shuffle[0] + number
    @browser = Watir::Browser.new :chrome
    @browser.goto('https://old.reddit.com/register')
    #sleep(1)
    @browser.text_field(:id => 'user_reg').set(username)
    #sleep(1)
    @browser.text_field(:id => 'passwd_reg').set(password)
    #sleep(1)
    @browser.text_field(:id => 'passwd2_reg').set(password)
    #sleep(1)
    @browser.text_field(:id => 'email_reg').set(email)    
    #sleep(4)
    @browser.button(:id => 'solver-button').click
    #sleep(3)
    @browser.button(class: 'c-btn c-btn-primary c-pull-right').click
    File.open("reddit_bots.txt", "a").puts username
    sleep(5)
    @browser.close
  end
end

a = Creator.new
while true
  a.create
  sleep(1800)
end
