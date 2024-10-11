function karateConfig() {
  karate.configure('connectTimeout', 50000)
  karate.configure('readTimeout', 50000)
  karate.configure("logPrettyRequest", true)
  karate.configure("logPrettyResponse", true)

  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'QA';
  }
  var config = {
    env: env
  }

  switch (env) {
    case 'dev':
      config.baseURL = 'https://jsonplaceholder.typicode.com/';
      break;
    case 'QA':
      config.baseURL = 'https://reqres.in/api/';
      break;
    case 'stg':
      config.baseURL = 'https://stg-reqres.in/api/';
      break;
    case 'prod':
      config.baseURL = 'https://reqres.in/api/';
      break;
    default:
      throw new Error('Unknown environment: ' + env);
  }

  return config;
}