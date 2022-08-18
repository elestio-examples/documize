# Documize on Elestio with CI/CD

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/documize"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Example CI/CD pipeline showing how to deploy Documize on Elestio.

# Once deployed ...

You are now able to sign to the Admin UI here:
    
    https://[CI_CD_DOMAIN]/
    login: [ADMIN_LOGIN] (set in env var ADMIN_LOGIN)
    password: [ADMIN_PASSWORD] (set in env var ADMIN_PASSWORD)


# SMTP Configuration

Unfortunately SMTP Configuration cannot be automated for Documize. 
Once your are logged in go to the Administration > SMTP Settings: 
https://[CI_CD_DOMAIN]/settings/smtp

There you should fill the configuration like this:

Host: 172.17.0.1
Port: 25
Username: (leave empty)
Password: (leave empty)
Sender Email: [DOMAIN]@vm.elestio.app (this is important, using any other value will fail)
Sender Name: Documize (you can change this value)
Sender Server Fully Qualified Domain Name: (leave empty)
Anonymous Authentication (Ignore Credentials): Must be checked

You can now save and test, and you should receive the test email in your inbox