class OnboardingModel {
  OnboardingModel(
      {required this.lottie, required this.title, required this.subtitle});

  final String lottie;
  final String title;
  final String subtitle;
}

List<OnboardingModel> onboardingTabs = <OnboardingModel>[
  OnboardingModel(
    lottie: 'assets/lottie_json/4801-weather-partly-shower.json',
    title: 'My \nWeather',
    subtitle:
        'With our app you can  easily know what to expect on the go as well  as get tips on how to best deal with whats coming your way',
  ),
  OnboardingModel(
    lottie: 'assets/lottie_json/1173-sun-burst-weather-icon.json',
    title: 'Explore \nGlobal',
    subtitle:
        'planning your trip become more easier with Edeya weather app, you can instantly see the whole world weather within few seconds',
  ),
  OnboardingModel(
    lottie: 'assets/lottie_json/35627-weather-day-clear-sky.json',
    title: 'Daily \nTips',
    subtitle:
        'with the sun rain etc.. comes challenges. but with our special tips to keep your day going. you dont have to worry about any disruptions!',
  ),
];
