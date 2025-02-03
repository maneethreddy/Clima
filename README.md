**Clima - Weather App 🌤️**


**Overview**

Clima is a sleek, dark-mode enabled weather application designed to provide real-time weather information. 
Using GPS data from your iPhone, Clima delivers up-to-date weather conditions for your current location and allows users to manually search for weather details in any city worldwide.


**Features**

🌍 Real-Time Weather Data: Get accurate, live weather information.

📍 Location-Based Weather: Automatically fetch weather details for your current location using GPS.

🔍 City Search: Manually search and display weather information for any city.

🌑 Dark Mode: User-friendly dark mode interface for a sleek appearance and reduced eye strain.


**Technologies Used**

- Swift: Core programming language.

- UIKit: Building user interfaces.

- CoreLocation: For accessing GPS data.

- URLSession: For API requests.

- OpenWeatherMap API: Fetch real-time weather data.

- Dark Mode Compatibility: Supports iOS dark mode for better user experience.


**Prerequisites**

- macOS with Xcode installed.

- An active internet connection for fetching live data.

- API Key from OpenWeatherMap.



**### Condition Codes**
```
switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
```


