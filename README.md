## Resevamos tech lead challenge

### Up and Running

Clone the repository:

```git clone git@github.com:luiscarlos-gonzalez/reservamos-challenge.git```

Install Gems:

```bundle install```

Copy the `.env.example` to `.env`

```cp .env.example .env```

Add to .env the Open Weather Key.

Run the server and visit the home.

```rails s```

Go to [localhost:3000](http://localhost:3000)

### Improvements 

With more time I could add the following points.

* Error handling.
* Add limit for 5 cities only.
* Tests, add unit test for services, controllers and feature tests with capybara.
* Reduce complexity of the `ForecastController#create` method for reduce the ABC size.
* Reduce complexity of the `OpenWeatherMap::GetForecastService#call` method for reduce the ABC size.
* Add some stimulus or react code to make the application more interactive.
  * For example to get a list of suggested cities accordantly with the text written by the user.
  * Update the table using JS. 
