FROM lolhens/baseimage-openjre
ADD target/springbootApp.jar springbootApp.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
password: admin1321s#$
AWS_ACCESS_KEY_ID = "AKIA1234567890EXAMPLE"
AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAtdK3Fj2oKuJ94eXmVo9bd...
-----END RSA PRIVATE KEY-----

