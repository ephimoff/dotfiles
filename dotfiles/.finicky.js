module.exports = {
  // browser names: 
  // Brave Browser
  // Google Chrome
  // Safari
  defaultBrowser: 'Safari',
  handlers: [
    {
      match: finicky.matchHostnames([
        // 'www.smartrecruiters.com',
        /.*\.google.com$/, // match all google subdomains
        /.*\.greenhouse.io$/, // match all google subdomains
      ]),
      browser: 'Brave Browser',
    },
    {
      match: finicky.matchHostnames([
        'app.qulture.rocks',
        'miro.com',
        'sumupteam.atlassian.net',
        'sam-app.ro',
      ]),
      browser: 'Brave Browser',
    },
    {
      // Open these urls in Chrome
      match: ({ url }) => url.pathname.includes('sumupteam'),
      browser: 'Brave Browser',
    },
    {
      // Open these urls in Chrome
      match: ({ url }) => url.pathname.includes('sumup'),
      browser: 'Brave Browser',
    },
    // {
    //   // Open these urls in Slack app
    //   match: finicky.matchHostnames([
    //     "wkda-eng.slack.com",
    //   ]),
    //   browser: "com.tinyspeck.slackmacgap"
    // },
  ],
  rewrite: [
    {
      // Redirect all https://slack.com/app_redirect?team=team=apegroup&channel=random
      // to slack://channel?team=apegroup&id=random
      match: ({ url }) =>
        url.host.includes('slack.com') && url.pathname.includes('app_redirect'),
      url({ url }) {
        const team = url.search
          .split('&')
          .filter((part) => part.startsWith('team'));
        var channel =
          '' +
          url.search.split('&').filter((part) => part.startsWith('channel'));
        var id = channel.replace('channel', 'id');

        return {
          protocol: 'slack',
          username: '',
          password: '',
          host: 'channel',
          port: null,
          pathname: '',
          search: team + '&' + id,
          hash: '',
        };
      },
    },
  ],
};
