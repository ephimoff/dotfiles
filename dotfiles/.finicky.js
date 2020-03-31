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
    // {
    //   // Open these urls in Slack app
    //   match: finicky.matchHostnames([
    //     "wkda-eng.slack.com",
    //   ]),
    //   browser: "com.tinyspeck.slackmacgap"
    // },
  ]
};