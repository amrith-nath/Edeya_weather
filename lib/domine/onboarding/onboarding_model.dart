class OnboardingModel {
  OnboardingModel(
      {required this.lottie, required this.title, required this.subtitle});

  final String lottie;
  final String title;
  final String subtitle;
}

List<OnboardingModel> onboardingTabs = <OnboardingModel>[
  OnboardingModel(
    lottie: 'assets/lottie_json/77253-hot-weather-animation.json',
    title: 'Weather',
    subtitle:
        'With our app you can  easily know what to expect on the go as well  as get tips on how to best deal with whats coming your way',
  ),
  OnboardingModel(
    lottie: 'assets/lottie_json/77075-location-weather-radar.json',
    title: 'Explore',
    subtitle:
        'Planning your trip become more easier with Edeya weather app, you can instantly see the whole world weather within few seconds',
  ),
  OnboardingModel(
    lottie: 'assets/lottie_json/76961-weather-alert-notification.json',
    title: 'Tips',
    subtitle:
        'With the sun rain etc comes challenges. but with our special tips to keep your day going. you dont have to worry about any disruptions!',
  ),
];
