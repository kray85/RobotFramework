import requests

def test_chrome_connection():
    # URL to the Chrome DevTools Protocol endpoint
    url = 'http://localhost:9222/json'

    try:
        response = requests.get(url)
        response.raise_for_status()
        tabs = response.json()
        print("Connected to Chrome successfully. Open tabs:")
        for tab in tabs:
            print(f"Title: {tab['title']}, URL: {tab['url']}")
    except requests.exceptions.RequestException as e:
        print(f"Failed to connect to Chrome: {e}")

if __name__ == "__main__":
    test_chrome_connection()