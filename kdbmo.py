from selenium import webdriver
import time
import os 

item = input("科目番号or科目名:")

#WebDriverのパス名を入力してください
driver = webdriver.Chrome('XXXX/XXXX/XXXX/XXXX')
driver.get('https://make-it-tsukuba.github.io/alternative-tsukuba-kdb/')

t_ID = driver.find_element_by_xpath('//*[@id="keyword"]')
t_ID.send_keys(item)

bot = driver.find_element_by_xpath('//*[@id="submit"]')
bot.click()

quit()