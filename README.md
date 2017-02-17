# _PDXCHKN_

#### _Hot Chicken Company Website Application, 1.0.0, 2/17/17_

#### By _Jacob Hixon, with thanks to Epicodus_

## Description

A simple web application that displays product info, allows user & admin accounts, allows complete CRUD/L functionality for products (varying authorization depending on user status).

## Setup/Installation Requirements

1. _Clone into repository located at https://github.com/jacobhixon47/pdx_hot_chicken.git ._
2. _In the terminal, make sure you are inside of the project folder, then type the following commands:_
  * `$ bundle install`
  * `$ rake db:create`
  * `$ rake db:migrate` _(Note: if this command returns an error, run `$ bundle exec rake db:migrate` instead_
  * `$ rake db:test:prepare`
  * `$ rails server`
3. _visit localhost:3000 in your browser_

## Admin Account Setup

_User accounts are not admins by default._
_User accounts have an "admin" attribute which is set to_ `false` _by default_
_Once a user account is created on the server, run the following commands in the Terminal to make an account have Admin authorization:_
* `$ rails console` _or_ `$ rails c`
* `> user = User.find(<user_id_here>)`
* `> user.admin = true`
* _Then run_ `> exit` _to exit the terminal_


## Technologies Used

* _Ruby on Rails_
* _ActiveRecord_
* _PostgreSQL_
* _Paperclip_
* _Devise_

### License

This file is part of (PDXCHKN).

    (PDXCHKN) is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    (PDXCHKN) is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with the (PDXCHKN). If not, see <http://www.gnu.org/licenses/>.

Copyright (c) 2017 **_Jacob Hixon_**
