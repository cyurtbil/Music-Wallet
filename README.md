# MusicWallet App

Heroku App: [MusicWallet](http://thawing-citadel-7864.herokuapp.com/)


MusicWallet is a music web app that users can search songs by keywords and categorize them according to their moods. Also users can search other users' wallets so they can listen and add from other users' categorized songs to their wallets. The app is using Soundcloud API to use the song, user data.


## STEP 1 - Install necessary gems

Add to your Gemfile:
```ruby
  gem 'devise'
  gem 'soundcloud'
  gem 'omniauth'
  gem 'omniauth-soundcloud', '~> 1.0.0'
```
and to your :development, :test group in Gemfile add:
```ruby  
  gem 'dotenv-rails'
```