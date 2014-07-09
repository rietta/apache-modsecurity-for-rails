# ModSecurity for Rails in Apache

This is part of the Web Application Security program that is managed by Rietta Inc.

The OWASP ruleset is designed to defend against common vulnerabilities found in many web applications. This version is compatible with the edition of mod_security that is available in Ubuntu LTS 12.04.

## Install ModSecurity

### Ubuntu Linux

```
sudo apt-get install libapache2-modsecurity
sudo apt-get install modsecurity-crs
cd /etc/modsecurity
mkdir activated_rules
cp modsecurity.conf-recommended modsecurity.conf
```

Do not do this
wget https://raw.githubusercontent.com/SpiderLabs/ModSecurity/master/modsecurity.conf-recommended
wget https://raw.githubusercontent.com/SpiderLabs/ModSecurity/master/unicode.mapping


### Sync down the OWASP Ruleset

After installing ModSecurity:

```
cd /etc/modsecurity
git clone https://github.com/rietta/owasp-modsecurity-crs.git
```

That is the public repository for the rule set that we are using with this recipe.

### Install this base package

```
git clone git@github.com:rietta/apache-modsecurity-for-rails.git
```


### Copy the rulesets into place

```
cp owasp-modsecurity-crs/modsecurity_crs_10_setup.conf.example  002_crs_10_setup.conf
```

Edit that as you like

### In the Apache configuration, for Ruby on Rails applications:

```
ln -s apache-modsecurity-for-rails/apache/rails_site.conf 003_rails_site.conf
```

## Activate the OWASP Rules that Compatible with Ruby on Rails

According to the OWASP documentation, you will want to create rules for:

1) The main modsecurity_crs_10_setup.conf file
2) Any rules from the base_rules directory
3) Any remaining rules from the optional_rules, slr_rules or experimental_rules directories.

### Base Rules
#### Core files problematic for Ruby on Rails

- modsecurity_crs_60_correlation.conf
- modsecurity_crs_21_protocol_anomalies.conf

#### Data Files

- modsecurity_35_bad_robots.data
- modsecurity_35_scanners.data
- modsecurity_40_generic_attacks.data
- modsecurity_41_sql_injection_attacks.data
- modsecurity_50_outbound_malware.data
- modsecurity_50_outbound.data

#### Rule Files that Work Well

- modsecurity_crs_20_protocol_violations.conf
- modsecurity_crs_21_protocol_anomalies.conf
- modsecurity_crs_23_request_limits.conf
- modsecurity_crs_30_http_policy.conf
- modsecurity_crs_40_generic_attacks.conf
- modsecurity_crs_41_xss_attacks.conf
- modsecurity_crs_42_tight_security.conf
- modsecurity_crs_45_trojans.conf
- modsecurity_crs_47_common_exceptions.conf
- modsecurity_crs_48_local_exceptions.conf.example
- modsecurity_crs_49_inbound_blocking.conf
- modsecurity_crs_50_outbound.conf
- modsecurity_crs_59_outbound_blocking.conf
- modsecurity_crs_60_correlation.conf


#### Symlink the Base Rules
```
cd /etc/modsecurity/activated_rules
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_35_bad_robots.data
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_35_scanners.data
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_40_generic_attacks.data
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_50_outbound_malware.data
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_50_outbound.data

ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_20_protocol_violations.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_21_protocol_anomalies.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_23_request_limits.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_30_http_policy.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_40_generic_attacks.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_41_xss_attacks.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_42_tight_security.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_45_trojans.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_47_common_exceptions.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_48_local_exceptions.conf.example
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_49_inbound_blocking.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_50_outbound.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_59_outbound_blocking.conf
ln -s ../owasp-modsecurity-crs/base_rules/modsecurity_crs_60_correlation.conf
```


### Optional Rules

```
cd /etc/modsecurity/activated_rules
ln -s ../owasp-modsecurity-crs/optional_rules/modsecurity_42_comment_spam.data
ln -s ../owasp-modsecurity-crs/optional_rules/modsecurity_crs_42_comment_spam.conf



ln -s ../owasp-modsecurity-crs/slr_rules/modsecurity_46_slr_et_wordpress.data
ln -s ../owasp-modsecurity-crs/slr_rules/modsecurity_crs_46_slr_et_wordpress_attacks.conf
```


problems with

ln -s ../owasp-modsecurity-crs/slr_rules/modsecurity_46_slr_et_sqli.data
ln -s ../owasp-modsecurity-crs/slr_rules/modsecurity_crs_46_slr_et_sqli_attacks.conf


### App Sensor

```
ln -s ../owasp-modsecurity-crs/experimental_rules/modsecurity_crs_40_appsensor_detection_point_2.0_setup.conf
ln -s ../owasp-modsecurity-crs/experimental_rules/modsecurity_crs_40_appsensor_detection_point_2.1_request_exception.conf
ln -s ../owasp-modsecurity-crs/experimental_rules/modsecurity_crs_40_appsensor_detection_point_2.9_honeytrap.conf
ln -s ../owasp-modsecurity-crs/experimental_rules/modsecurity_crs_40_appsensor_detection_point_3.0_end.conf
```

