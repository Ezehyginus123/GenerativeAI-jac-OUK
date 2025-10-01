import requests;


walker WeatherApp{
    has city: str, BASE_URL: str = "https://api.openweathermap.org/data/2.5/weather", 
    API_KEY: str = "your_api_key_here";
    
    can start with `root entry;
    can get_weather with turn entry;
    
}

node turn{
    # can check with WeatherApp entry;    
    
}


with entry:__main__ {
    print("=== Weather App ===");
    root spawn WeatherApp("california");
    root spawn WeatherApp("lagos");
    print("Thanks for using the Weather App!");
}




impl WeatherApp.start{
    if not [root --> (`?turn)] {
        next = root ++> turn();
    } else {
        next = [root --> (`?turn)];
    }
    visit next;
}

impl WeatherApp.get_weather{
    if [-->] {
        visit [-->];
    } else {
        """Fetch weather data for a city from OpenWeatherMap API.""";
        params = {
            "q": self.city,
            "appid": self.API_KEY,
            "units": "metric"
        };
        try{
            response = requests.get(self.BASE_URL, params=params, timeout=5);
            response.raise_for_status();
            data = response.json();
            if not data or data.get("cod") != 200{
                print("❌ City not found or error retrieving data.");
                visit [-->];
            }
            city = data["name"];
            country = data["sys"]["country"];
            temp = data["main"]["temp"];
            feels_like = data["main"]["feels_like"];
            condition = data["weather"][0]["description"].title();
            print (
                f"🌍 {city}, {country}"
                f"🌡 Temp: {temp}°C (Feels like {feels_like}°C)"
                f"☁ Condition: {condition}"
            );
        }
        except requests.exceptions.RequestException as e{
            print(f"Error fetching data: {e}");
            return {};
        }
    }
}



