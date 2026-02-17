require ["fileinto"];

# Test file with spaces
if header :contains "subject" "Test" {
    fileinto "Test";
}
