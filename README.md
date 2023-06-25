# WeatherApp
WeatherApp is a sample application that utilizes the Weather-Kit framework.

# Weather-Kit Framework
Weather-Kit is a Swift framework built with Combine. It offers two main methods for retrieving weather information: **getCityWeather(city: String)** and **getUserLocationWeather()**.

Weather-Kit utilizes the API provided by https://openweathermap.org/api/one-call-api to get weather data.

-***getCityWeather(city: String):*** This method allows you to fetch the weather data for a specific city. You need to pass the name of the city as a parameter.

-***getUserLocationWeather()***: This method enables you to retrieve the weather data for the user's current location.

To receive updates and observe changes in the weather data, you can subscribe to the **state** attribute, which is of type ***PassthroughSubject<LoadWeatherDataState, Never>()***. This attribute emits values of the **LoadWeatherDataState** type, allowing you to track the loading state of the weather data.

```
public enum LoadWeatherDataState {
    case didLoadWeatherData
    case error(WError)
}
```
**Please note that in order to use the Weather-Kit framework effectively, you should have a basic understanding of Swift Combine.**

#Example

```
import Weather_Kit
//...
private var weather = Weather()
//...
weather.getCityWeather(city: cityName)
//...
state.sink { state in
        switch state {
        case .didLoadWeatherData: //You can update UI
        case .error(let error ): //You can display error here
        }      
}.store(in: &cancellable)
```
PS: The returned error is of type WError, you can access message by **error.message** & error code by **error.cod**.
