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
        /.*\unz.atlassian.net$/, // match all google subdomains
        /.*\github.com$/, // match all google subdomains
        /.*\.office365.com$/, // match all google subdomains
        /.*\.sharepoint.com$/, // match all google subdomains
        /.*\.personio.de$/, // match all google subdomains
        /.*\.lucid.co$/, // match all google subdomains
        /.*\.lucidchart.co$/, // match all google subdomains
        /.*\.twint.ch$/, // match all google subdomains
      ]),
      browser: 'Brave Browser',
    },
    {
      match: finicky.matchHostnames([
        'app.qulture.rocks',
        'heidelpay',
        'unzer-group',
        'github',
      ]),
      browser: 'Brave Browser',
    },
    {
      // Open these urls in Chrome
      match: ({ url }) => url.pathname.includes('https://github.com/unzercorp'),
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
