name             'app1'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures app1'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'chef-puma'
depends "chef-solo-search"
depends "user"
depends "apt"
depends "postgresql"
depends "postgresql"
depends "postgresql"
depends "nginx"
depends "rvm"