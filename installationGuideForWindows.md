#Web Automation with Ruby (Cucumber, Cabybara) Installation Guide for Windows

1.Download and install Ruby from http://rubyinstaller.org/ . Install version 1.9.3. Make sure you check the option to “Add Ruby executables to your PATH.” or add ruby directory to your path manually.

2.Download and install the Ruby Development Kit from the same place, which will allow Ruby to build native extensions for libraries. Instructions are available here: https://github.com/oneclick/rubyinstaller/wiki/Development-Kit. Make sure  you get the right version for your ruby.

3.Go to Command Promt and check ruby version by:
> ruby -v


Make sure the right version is installed.

4.To install Cucumber gem from Command Promt:
>gem install cucumber


Ps. You may need to configure your proxy with:

> "HTTP_PROXY=http://user:password@proxy-hostname:port"



5) To install Capybara gem from Command Promt:
> gem install capybara 

6) To install rspec gem from Command Promt:
> gem install rspec 

7) You’ll want need a browser with developer tools. Chrome or Firefox with firebug will do.


