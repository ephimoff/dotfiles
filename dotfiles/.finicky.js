module.exports = {
  defaultBrowser: "Safari",
  handlers: [
    {
      // Open these urls in Chrome
      match: finicky.matchHostnames([
        "www.smartrecruiters.com",
        /.*\.google.com$/, // match all google subdomains
        /wkdauto/, 
        /auto1/, 
      ]),
      browser: "Google Chrome"
    },
    {
      // Open these urls in Chrome
      match: ({ url }) => url.pathname.includes("wkda"),
      browser: "Google Chrome"
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
      match: ({ url }) => url.host.includes("slack.com") && url.pathname.includes("app_redirect"),
      url({ url }) {
        const team = url.search.split('&').filter(part => part.startsWith('team'));
        var channel = "" + url.search.split('&').filter(part => part.startsWith('channel'));
        var id = channel.replace("channel", "id");

        return {
            protocol: "slack",
            username: "",
            password: "",
            host: "channel",
            port: null,
            pathname: "",
            search : team + '&' + id,
            hash: ""

        }
        
      }
    } 
  ]
};