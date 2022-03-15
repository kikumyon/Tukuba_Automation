from selenium import webdriver
import time
import os 

item = input("科目番号or科目名:")

#WebDriverのパス名を入力してください
driver = webdriver.Chrome('XXXX/XXXX/XXXX/XXXX')
driver.get('https://kdb.tsukuba.ac.jp')

t_ID = driver.find_element_by_xpath('//*[@id="freeWord"]')
t_ID.send_keys(item)

bot = driver.find_element_by_xpath('//*[@id="openingCourseListForm"]/table[1]/tbody/tr[7]/td/input[1]')
bot.click()

quit()