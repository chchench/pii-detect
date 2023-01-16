# PII Detect

Some Objective-C code snippet for detecting credit card numbers and SSNs on the Mac to share


## Background

Last year I wrote a program that would detect filesystem changes on my Mac, flag any file that contains Personal Identifiable Information (PII), and alert me periodically to take action to secure the document.

Overall getting the basic application to work was pretty straightforward. There was plenty of info on numbering scheme for social security number, credit card numbers issued by various issuers, etc., and there were also examples of regular expressions one could use to do matching.

However, figuring out what macOS's native regular expression technology supported took a surprising amount of time. Probably spent more than a few hours just googling for information and trying out different regexes and inputs to figure out what would work on macOS.

Hopefully making this code available will save someone else a little bit of time.


## License

Making the source code to this app available under
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)