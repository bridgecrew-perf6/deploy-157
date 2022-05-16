# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
name                    'videobug-server'
maintainer              'Parth Mudgal'
maintainer_email        'artpar@gmail.com'
license                 'Apache License, Version 2.0'
description             'Installs/Configures videobug server'
source_url              'https://github.com/getvideobug/deploy'
issues_url              'https://github.com/getvideobug/deploy/issues'
chef_version            '>= 12.1'
version                 '0.0.1'

depends 'c2d-config'
depends 'apache2'
depends 'mysql'
depends 'php74'
depends 'phpmyadmin'
supports 'debian'
