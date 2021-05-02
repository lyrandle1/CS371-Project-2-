import React from 'react';
import { useHistory } from 'react-router';
import { Route } from 'react-router-dom';
import { LoginCallback, SecureRoute, Security } from '@okta/okta-react';
import { OktaAuth } from '@okta/okta-auth-js';
import Home from './components/Home';
import Header from './components/Header';

const oktaAuth = new OktaAuth({
  issuer: 'https://dev-68852563.okta.com/oauth2/default',
  clientId: '0oao7phv5beGzHLer5d6',
  redirectUri: `http://localhost:3000`,
});

function SecuredApp() {
  const history = useHistory();

  const onAuthRequired = function () {
    history.push('/');
  };

  return (
    <Security oktaAuth={oktaAuth} onAuthRequired={onAuthRequired}>
      <Header/>
      <SecureRoute exact path="/" component={Home} />
      <Route path="/callback" component={LoginCallback} />
    </Security>
  );
}

export default SecuredApp;
