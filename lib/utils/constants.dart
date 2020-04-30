class Constants {
  static const baseUrlData = "https://api.themoviedb.org/3/movie/";

  static const baseUrlImageExtraSmall = "https://image.tmdb.org/t/p/w185";
  static const baseUrlImageSmall = "https://image.tmdb.org/t/p/w342";
  static const baseUrlImageBig = "https://image.tmdb.org/t/p/w500";
  static const baseUrlImageExtraBig = "https://image.tmdb.org/t/p/w1280";

  static const apiKey = "api_key=0093b443517503cc33ee2e181513a5a3";
  static const languaje = "languaje=en-US";
  static const page = "page";

  // services
  static const nowPlaying = "now_playing";
  static const popular = "popular";
  static const upcoming = "upcoming";

  // full services
  static const nowPlayingFull = "$baseUrlData$nowPlaying?$apiKey&$languaje&$page=1";
  static const popularFull = "$baseUrlData$popular?$apiKey&$languaje&$page=1";
  static const upcomingFull = "$baseUrlData$upcoming?$apiKey&$languaje&$page=1";
}