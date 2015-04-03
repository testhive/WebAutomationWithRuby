#Web Automation with Ruby (Cucumber, Cabybara) Installation Guide for Mac

1.Install RVM & Ruby 

RVM is used to manage multiple release of Ruby.

From Terminal:
>curl -L get.rvm.io | bash -s stable


>source ~/.rvm/scripts/rvm


>$ rvm list known


>$rvm install 1.9.3

2.Install the required gems

From Terminal:
>gem update --system


>gem install rspec --no-ri --no-rdoc


>gem install cucumber --no-ri --no-rdoc


>gem install capybara --no-ri --no-rdoc


3.You’ll want need a browser with developer tools. Chrome or Firefox with firebug will do.
