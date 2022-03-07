abstract class ApiUtils {
  static const baseUrl = 'https://api.themoviedb.org';

  static const movieList = baseUrl + '/3/movie/upcoming';
  // e.g https://api.themoviedb.org/3/movie/upcoming?api_key=11b0e7b87b3bdc8b4defacf0749908db

  // it will require a movie id at the end
  static const movieDetails = baseUrl + '/3/movie/';
  // e.g https://api.themoviedb.org/3/movie/414906?api_key=11b0e7b87b3bdc8b4defacf0749908db
  // 414906 is a movie id

  static const getImages = baseUrl + '/3/movie/<movie-id>/images';
  static const prefixImageLoadPath = 'https://image.tmdb.org/t/p/w500';

  // video play
  // https: //api.themoviedb.org/3/movie/414906/videos
}
