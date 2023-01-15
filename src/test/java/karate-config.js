function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl: 'https://www.lumiere32.my/testapi/v1/'
  }
  
  if (env == 'dev') {
    config.userEmail = 'gaurav+1@lumiere32.sg'
    config.userPassword = '1234567a'
  } 
  if (env == 'qa') {
    config.userEmail = 'gaurav+2@lumiere32.sg'
    config.userPassword = '1234567a'
  }

  // var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken
  // karate.configure('headers', {Authorization: 'Bearer ' + accessToken})
  
  return config;
}