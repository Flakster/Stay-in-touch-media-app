# Scaffold for social media app with Ruby on Rails

> This project consists in building a social media app called “Stay in touch” with the following features:

1. As a guest user:

   1. I want to be able to create account/log in.
   2. I can see only “Sign in” and “Sign out” page.

2. As a logged-in user:

   1. I want to be able to see all users list.
   2. I want to be able to see selected user page with their user name and all posts written by them (the most recent posts on the top).
   3. I want to be able to send a friendship invitation.
   4. I want to see a button “Invite to friendship” next to the name of user who is not my friend yet - on both users’ list and single user page.
   5. I want to be able to see pending friendship invitations sent to me from other users.
   6. I want to be able to accept or reject friendships invitation.
   7. I want to be able to create new posts (text only).
   8. I want to be able to like/dislike posts (but I can like single post only once).
   9. I want to be able to add comments to posts.
   10. I want to be able to see “Timeline” page with posts (with number of likes and comments) written by me and all my friends (the most recent posts on the top).
   11. Timeline page should be the root page of the app.


## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4
- Postgresql
- Devise
- Bulma

## Live Demo

  Will be available soon

### Prerequisites

- Ruby: 2.7.0
- Rails: 5.2.4
- Postgres: >=9.5


## Getting Started

To get a local copy up and running follow these simple example steps

- Clone the repository by running in the console of your local machine the following command

  ```
  git clone https://github.com/Flakster/ror-social-scaffold.git
  ```
- Change directory to ror-Flakster-social

### Setup

If you have another ruby version and have rbenv, you can run:
```
  rbenv install 2.7.0
```

Install gems with:

```
bundle install
```

Setup database with:

```
  sudo -u postgres psql
  CREATE ROLE events WITH CREATEDB LOGIN PASSWORD 'pass123';
```
  Exit postgres console \q
  Make sure you have your yarn packages up to date. If not:
```
  yarn install --check-files
```
  Then
```
   rails db:create
   rails db:migrate
```



### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec spec/models/. --format documentation
    rpsec spec/features/. --format documentation
```

### Deployment

```
 heroku create name-app
 git push heroku +HEAD:master
 heroku run rails db:migrate
```

## Authors

👤 **Carlos Santamaria**

- Github: [@flakster](https://github.com/flakster)
- Twitter: [@flakster](https://twitter.com/flakster)
- Linkedin: [@cjsb](https://www.linkedin.com/in/cjsb)

👤 **Oscar Alfredo Gómez Elizarrarás**

- Github: [@AlfredoElizarraras](https://github.com/AlfredoElizarraras)
- Twitter: [@OscarAlfredoGm4](https://twitter.com/OscarAlfredoGm4)
- Linkedin: [@OscarAlfredoGómezElizarrarás](https://mx.linkedin.com/in/oscar-alfredo-gomez-elizarraras)

---

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://microverse.org)
- [Odin project](https://www.theodinproject.com/)

---

## 📝 License

This project is [MIT](https://github.com/Flakster/ror-social-scaffold/blob/master/LICENSE) licensed.

Copyright 2020 Carlos Santamaria and Oscar Alfredo Gómez Elizarrarás

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---
