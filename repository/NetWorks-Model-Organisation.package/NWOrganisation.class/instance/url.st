accessing
url
  ^ WAUrl new
    host: dnsName;
    addToPath: self uri;
    yourself