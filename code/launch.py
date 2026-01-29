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

# --- ROBOT THREAD (Keep this as is) ---
def bypass_certificate_popup():
    print("[Robot] Waiting for popup...")
    time.sleep(6) # Increased slightly to ensure page triggers popup
    pyautogui.press('enter') 
    print("[Robot] Enter pressed.")

# --- CONFIGURATION ---
chrome_options = Options()
chrome_options.add_argument("--ignore-certificate-errors")
chrome_options.add_experimental_option("detach", True)

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=chrome_options)

try:
    # 1. Start Robot
    threading.Thread(target=bypass_certificate_popup, daemon=True).start()

    # 2. Go to Login
    print("[Main] Navigating to Login...")
    driver.get("https://cpems.pemc.ph/login")
    
    # 3. Wait for the Dashboard to load after the Robot hits Enter
    # We wait for the "Energy" menu to appear in the sidebar
    wait = WebDriverWait(driver, 20)
    
    print("[Main] Waiting for Dashboard sidebar...")
    # Step 3.1: Click 'Energy'
    energy_menu = wait.until(EC.element_to_be_clickable((By.XPATH, "//span[contains(text(), 'Energy')]")))
    energy_menu.click()
    
    # Step 3.2: Click 'Transactions'
    transactions = wait.until(EC.element_to_be_clickable((By.XPATH, "//span[contains(text(), 'Transactions')]")))
    transactions.click()
    
    # Step 3.3: Click 'OCC'
    occ_link = wait.until(EC.element_to_be_clickable((By.XPATH, "//a[contains(text(), 'OCC')]")))
    occ_link.click()

    print("[Main] Successfully reached the OCC page!")

except Exception as e:
    print(f"Error during navigation: {e}")