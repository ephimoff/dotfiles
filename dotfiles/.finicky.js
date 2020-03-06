module.exports = {
  defaultBrowser: "Safari",
  handlers: [
    {
      // Open these urls in Chrome
      match: finicky.matchHostnames([
        "docs.google.com", 
        "console.cloud.google.com",
        /wkdauto/, 
        /auto1/, 
      ]),
      browser: "Google Chrome"
    },
  ]
};