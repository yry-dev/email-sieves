require ["fileinto", "mailbox"];

# Filter newsletter emails
if header :contains "subject" "Newsletter" {
    fileinto :create "Newsletters";
}
