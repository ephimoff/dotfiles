module.exports = {
  // browser names:
  // Brave Browser
  // Google Chrome
  // Safari
  // Arc
  defaultBrowser: 'Arc',
  handlers: [
    {
      match: finicky.matchHostnames([
        // 'www.smartrecruiters.com',
        // http://tableau.sam-app.ro/#/site/acquisition/views/MGCoffeeShopAnalysis/OverviewofSumUpMerchants2?:iid=1
        /.*\.google.com$/, // match all google subdomains
        /.*\.greenhouse.io$/, // match all google subdomains
        /.*\.figma.com$/, // match all google subdomains
        /.*\.sam-app.ro$/, // match all google subdomains
      ]),
      browser: 'Brave Browser',
    },
    {
      match: finicky.matchHostnames([
        'app.qulture.rocks',
        'miro.com',
        'sumupteam.atlassian.net',
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
    {
      // Open these urls in Chrome
      match: ({ url }) => url.pathname.includes('SumUp'),
      browser: 'Brave Browser',
    },
    {
      // Open these urls in Chrome
      match: ({ url }) =>
        url.pathname.includes(
          'http://tableau.sam-app.ro/#/site/acquisition/views/MGCoffeeShopAnalysis/OverviewofSumUpMerchants2?:iid=1'
        ),
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
