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
        /.*\unz.atlassian.net$/, 
        /.*\github.com$/, 
        /.*\.office365.com$/, 
        /.*\.sharepoint.com$/, 
        /.*\.personio.de$/, 
        /.*\.lucid.co$/, 
        /.*\.lucidchart.co$/, 
        /.*\.twint.ch$/, 
        /.*\.lever.co$/, 
        /.*\.wbtmaster.de$/, 
        /.*\.freshdesk.com$/, 
        /.*\.freshservice.com$/, 
        /.*\.yammer.com$/, 
        /.*\.datadoghq.eu$/, 
        /.*\.ct.sendgrid.net$/,
        /.*\.teams.cdn.office.net$/,

      ]),
      browser: 'Brave Browser',
    },
    {
      match: finicky.matchHostnames([
        'app.qulture.rocks',
        'heidelpay',
        'unzer-group',
        'github',
        'unzer',
      ]),
      browser: 'Brave Browser',
    },
    {
      // Open these urls in 'Work' browser
      match: ({ url }) => url.pathname.includes('https://github.com/unzercorp'),
      browser: 'Brave Browser',
    },
    {
      // Open these urls in 'Work' browser
      match: ({ url }) =>
        url.pathname.includes(
          'http://tableau.sam-app.ro/#/site/acquisition/views/MGCoffeeShopAnalysis/OverviewofSumUpMerchants2?:iid=1'
        ),
      browser: 'Brave Browser',
    },
    {
      // Open links from Teams and Outlook in 'work' browser
      // match: ({opener}) =>
      //   ["Mail", "Microsoft Outlook"].includes(opener.name),
      match: ({opener}) => 
        ["com.microsoft.teams", "com.microsoft.Outlook"].includes(opener.bundleId),
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
