require 'httparty'
require 'cgi'

MEDIA_URLS = [
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMM4e487dc2a194ab9526ddb1ec552f51ff%2FMedia%2FMEdd8e64ab56697e5ebe136bddd0651ff6&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMM4a3fd3fe75040ad6c732cda8a06b08f5%2FMedia%2FME6348a1c85836a8399a65ee638bc35535&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMM0c2853bdadd5ca8b9e26f1a9d0de1c3e%2FMedia%2FME9581058186553a6f210544160a799da1&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMMbb64815248fdae8813d456e3d7be599e%2FMedia%2FMEabb3b9c82baa5a7a5ed95e5934cdaca5&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMMbb96acb4cfa2d4e679a767072ed2b12c%2FMedia%2FME0350d45dbc6e032096ac8a579dbcdbfa&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMMecfccbc822d2034239cdd40d5710d22a%2FMedia%2FME7e16e5197f658a729a840f0bfdc62bb9&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMM0267874eb6621b3b6fe3e364c85c8c31%2FMedia%2FMEad11a85e541773814684732bb1443c6b&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMM775a506a3d2d3ae75e57f8ae5f768239%2FMedia%2FME8ce96d07d964aa4716a2833cdceed34d&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMM29e804c79b8da7e05078b8401106fbcc%2FMedia%2FME093d1e0443cfa7677832f9e25337ad1b&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMM59dc6a53eee0155081847518b749287d%2FMedia%2FMEca4a98edf759a18169ad52088cb795cf&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMM68e6b85f913fcd865f562295ca3b7b57%2FMedia%2FME93461372f8de1ae10ac4667711259630&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMMdfe548cf42d75d8e9e9404c8d6a48ba7%2FMedia%2FME86c94c25ab0d1ca96f1dfa08ee6c4d69&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMMc4cb879f93ae1f8b8ed665d9c3718bc5%2FMedia%2FME500feb11d522c218b7d3ff8b7afacaf9&ApiVersion=2010-04-01",
  # "https%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FAC935bf45b17fecfcb9fcf40c37b296e16%2FMessages%2FMMbde8c84b0ddebd26100c78ae3a0a26bb%2FMedia%2FME430136559013ccbde04b16db97c3f93b&ApiVersion=2010-04-01"
]

MEDIA_URLS.each do |url|
  response = HTTParty.delete(CGI.parse(url).first.first, basic_auth: { username: "AC935bf45b17fecfcb9fcf40c37b296e16", password: "c7554cb97c263b7eb5fbdbf17c43b1dd" })
  puts response
end