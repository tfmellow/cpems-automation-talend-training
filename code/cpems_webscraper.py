# imports
import threading
import pyautogui
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager

# TODO: find other way to bypass certificate selection
def bypass_certificate_popup():
    """Wait for certificate popup and hit enter"""
    print("Waiting for popup...")
    time.sleep(6) 
    pyautogui.press('enter')
    print("'Enter' key pressed.")

# configuration
chrome_options = Options()
chrome_options.add_argument("--ignore-certificate-errors")  # to ignore "Advanced > Proceed" warning
chrome_options.add_experimental_option("detach", True)      # keeps window open after script ends

# locates appropriate chromedriver.exe
service = Service(ChromeDriverManager().install())

# opens browser window
driver = webdriver.Chrome(service=service, options=chrome_options)
driver.maximize_window()

# TODO: add delay on button clicking
try:
    # bypass certificate while website is loading
    threading.Thread(target=bypass_certificate_popup, daemon=True).start() 

    print("Accessing CPEMS website...")
    driver.get("https://cpems.pemc.ph/login")
    # wait time for loading
    wait = WebDriverWait(driver, 20)

    # login
    print("Entering credentials...")

    # locate username field
    username_field = wait.until(EC.presence_of_element_located((By.NAME, "username")))
    username_field.send_keys("FRLCGEN")

    # locate password field
    password_field = wait.until(EC.presence_of_element_located((By.NAME, "password")))
    password_field.send_keys('W3smCa$3cNan!')
    
    # click login button
    login_btn = wait.until(EC.presence_of_element_located((By.XPATH, "//button[@type='submit']")))
    login_btn.click()

    # TODO: add assertion for successful login

    # find energy
    energy_btn = wait.until(EC.presence_of_element_located((By.XPATH, "//i[@class='fa fa-cubes']")))
    energy_btn.click()

    # TODO: difference of using '.presence_of_element_located' and '.element_to_be_clickable'
    # https://stackoverflow.com/questions/26943847/check-whether-element-is-clickable-in-selenium
    transactions_btn = wait.until(EC.element_to_be_clickable((By.XPATH, "//i[@class='fa fa-newspaper-o']")))
    transactions_btn.click()

    occ_btn = wait.until(EC.element_to_be_clickable((By.XPATH, "(//i[@class='fa fa fa-cube'])[1]")))
    occ_btn.click()

    # show entries
    num_entries = wait.until(EC.presence_of_element_located((By.NAME, "occ-grid_length")))
    num_entries.click()

    # TODO: try using selenium's Select class
    max_entries = wait.until(EC.element_to_be_clickable((By.XPATH, "//option[text()='1500']")))
    max_entries.click()

    # TODO: pagination

    # select all 
    select_btn = wait.until(EC.presence_of_element_located((By.XPATH, "//button[@class='dt-button buttons-select-all']")))
    select_btn.click()

    # export excel file
    export_btn = wait.until(EC.presence_of_element_located((By.XPATH, "//button[@class='dt-button buttons-excel buttons-html5']")))
    export_btn.click()

    print("Web scraping successful.")

except Exception as e:
    print(f"Error during web scraping: {e}")