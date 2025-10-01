# GenerativeAI-jac-OUK
Created and integrated a byllm in a weather APP using Jac Language

🌦️ WeatherApp in JAC

This repository contains two implementations of a simple Weather Application built using the JAC language.
The application fetches live weather data from the OpenWeatherMap API and demonstrates two approaches:

1. weather_basic.jac is a Basic WeatherApp, it fetches and prints weather details (temperature, feels-like, and condition).

2. weather_byllm.jac is a BYLLM-Enhanced WeatherApp, it integrates a language model to generate natural language descriptions of the weather.
Both uses graph-based execution with JAC walkers and nodes.

🛠️ Requirements

1. Python 3.10+

2. JAC Language

3. Requests library

4. API Key from OpenWeatherMap

5. API Key from Gemini.



⚡ Setup

1. Clone the repo:
   git clone https://github.com/Ezehyginus123/GenerativeAI-jac-OUK.git
   cd GenerativeAI-jac-OUK

2. Install dependencies:
   pip install requests jaclang byllm

3. Export your Gemini API key:
   export GEMINI_API_KEY="your_api_key_here"

5. Add your OpenWeatherMap API key to the weather_basic.jac and weather_byllm.jac files.

6. Run the JAC program:
   jac weather_basic.jac
       or
   jac weather_byllm.jac
