from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

# 1. SETUP OPTIONS TO CONNECT TO THE OPEN PORT
chrome_options = Options()
# This is the "Magic Link" that connects Python to your open browser
chrome_options.add_experimental_option("debuggerAddress", "127.0.0.1:9222")

# 2. INITIALIZE THE DRIVER
# Note: We still use the service to ensure we have the right driver version
service = Service(ChromeDriverManager().install())

try:
    # This won't open a new window; it will take control of the one you opened
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
    print("Successfully connected to the 'CPEMS Bot' window!")
    print(f"I am currently looking at the page: {driver.title}")

    # Now we can start the Phase 2 Navigation!
    # Let's test it by trying to refresh the page
    driver.refresh()
    print("The bot successfully refreshed the page. We have control.")

except Exception as e:
    print(f"Could not connect to Chrome. Is the 'CPEMS Bot' shortcut running? Error: {e}")