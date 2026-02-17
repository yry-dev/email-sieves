require ["fileinto", "mailbox"];

# Filter social media notifications
if header :contains "from" ["facebook.com", "twitter.com", "linkedin.com"] {
    fileinto :create "Social";
}
