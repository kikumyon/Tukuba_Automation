from selenium import webdriver
import chromedriver_binary
from selenium.webdriver.chrome.options import Options
option = Options()
option.add_argument('--headless')
import time
import os 

#WebDriverのパス名を入力してください
driver = webdriver.Chrome('XXXX/XXXX/XXXX/XXXX',options=option)
driver.get('https://twins.tsukuba.ac.jp/')

time.sleep(0.5)

tx1 = driver.find_element_by_xpath('//*[@id="keiji-portlet"]/table/tbody/tr[1]/td/a')
tx2 = driver.find_element_by_xpath('//*[@id="keiji-portlet"]/table/tbody/tr[2]/td/a')
tx3 = driver.find_element_by_xpath('//*[@id="keiji-portlet"]/table/tbody/tr[3]/td/a')
tx4 = driver.find_element_by_xpath('//*[@id="keiji-portlet"]/table/tbody/tr[4]/td/a')
tx5 = driver.find_element_by_xpath('//*[@id="keiji-portlet"]/table/tbody/tr[5]/td/a')
tx6 = driver.find_element_by_xpath('//*[@id="keiji-portlet"]/table/tbody/tr[6]/td/a')
tx7 = driver.find_element_by_xpath('//*[@id="keiji-portlet"]/table/tbody/tr[7]/td/a')

print()
print(tx1.text)
print()
print(tx2.text)
print()
print(tx3.text)
print()
print(tx4.text)
print()
print(tx5.text)
print()
print(tx6.text)
print()
print(tx7.text)
print()

driver.close()
driver.quit()