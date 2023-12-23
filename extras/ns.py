import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
import pandas as pd


# Set the path to your ChromeDriver executable
chrome_path = 'C:\\Users\\Diacto\\Downloads\\chromedriver_win32\\chromedriver.exe'

# Set up Chrome options (optional)
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--headless')  # Run Chrome in headless mode (without a graphical user interface)

# Start the Chrome browser
driver = webdriver.Chrome( options=chrome_options)

# Open the website
url = "https://www.nseindia.com/report-detail/eq_security"
driver.get(url)

# Wait until the symbol input element is present on the page
symbol_input_element = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.ID, "hsa-symbol"))
)

# Use JavaScript to set the value of the input element
driver.execute_script("arguments[0].value = 'TCS';", symbol_input_element)

# Simulate pressing the "Enter" key
symbol_input_element.send_keys(Keys.RETURN)



# Allow some time for the page to load (you may need to adjust the sleep duration)
time.sleep(5)

# Now you can proceed with extracting the data or interacting with the page as needed
# ...
# Extract the table data
table = driver.find_element_by_xpath('//table[@id="hsaTable"]')
table_html = table.get_attribute('outerHTML')

# Close the browser
driver.quit()

# Convert the HTML table to a Pandas DataFrame
data = pd.read_html(table_html)[0]

# Display the DataFrame
print("\nScraped Data:")
print(data)


# Close the browser when done

