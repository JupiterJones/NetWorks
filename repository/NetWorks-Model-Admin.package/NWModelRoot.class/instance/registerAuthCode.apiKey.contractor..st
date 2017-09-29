authorisations
registerAuthCode: authCode apiKey: apiKey contractor: aContractor
  self authorisations
    at: authCode
    put:
      (Dictionary new
        at: #'contractor' put: aContractor;
        at: #'authCode' put: authCode;
        at: #'apiKey' put: apiKey;
        at: #'expiryTime' put: DateAndTime now + 10 minutes;
        yourself)