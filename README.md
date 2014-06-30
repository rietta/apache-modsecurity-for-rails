# ModSecurity for Rails in Apache

This is part of the Web Application Security program that is managed by Rietta Inc.

The OWASP ruleset is designed to defend against common vulnerabilities found in many web applications. This version is compatible with the edition of mod_security that is available in Ubuntu LTS 12.04.

## Sync down the OWASP Ruleset

After installing ModSecurity:

```
cd /etc/modsecurity
git clone https://github.com/rietta/owasp-modsecurity-crs.git
```

That is the public repository for the rule set that we are using with this recipe.

## Install this base package


## Copy the rulesets into place

cp owasp-modsecurity-crs/modsecurity_crs_10_setup.conf.example  002_crs_10_setup.conf
cp modsecurity.conf-recommended modsecurity.conf
Edit that as you like