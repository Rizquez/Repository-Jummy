import { createAuth0 } from '@auth0/auth0-vue';
import router from './router';

export default {
  install: (app) => {
    app.use(
      createAuth0({
        domain: 'dev-svn5pro1gx71qriy.us.auth0.com',
        clientId: 'ZoGdT8U0UPbb0dwLRrZJiAGMM9PRQANI',
        authorizationParams: {
          redirect_uri: window.location.origin+'/callback',
        },
      })
    );
  },
};
