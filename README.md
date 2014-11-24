# MusicWallet App

Heroku App: [MusicWallet](https://guarded-sea-6764.herokuapp.com/)


MusicWallet is a music web app that users can search songs by keywords and categorize them according to their moods. Also users can search other users' wallets so they can listen and add from other users' categorized songs to their wallets. The app is using Soundcloud API to use the song, user data. Also the app using omniauth for authorization with the Soundcloud user info. The main feature of this app that differentiates from simple playlist creating is that users can filter other users by their wallet name and see and listen their songs in select users' wallets.


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
Resources for gems:

  1. [devise](https://github.com/plataformatec/devise)
  2. [soundcloud](https://github.com/soundcloud/soundcloud-ruby)
  3. [omniauth](https://github.com/intridea/omniauth)
  4. [omniauth-soundcloud](https://github.com/soundcloud/omniauth-soundcloud)

Further Understanding for omniauth: [Facebook Omniauth Example](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)

## STEP 2 - Creating an App on SoundCloud

You need to go to [SoundCloud Developers](https://developers.soundcloud.com/) website and sign-in with your account. If you don't have a SoundCloud account, you must sign-up for it, otherwise you won't be able to use SoundCloud API. 

After singing in to SoundCloud account, you should go to Your Apps section and create your app on SoundCloud. 

**IMPORTANT:** Set your redirect URI as ```http://localhost:3000/users/auth/soundcloud/callback``` in development stage. This will send your page to your websites home page after it authenticate with SoundCloud user information. 

Now, you should have Client ID and Client Secret.

**IMPORTANT:** You should properly define them in .env file and add the .env file to your .gitignore file so you won't reveal them on github repo. There some examples provided at links above that how can you access your keys from .env file.


## STEP 3 - Authentication

After you structure your MVC design patern and database schema, you should change the devise-omniauth authentication with user e-mail address to authentication woth username because as you can see from the omniauth-soundcloud link provided above, the Soundcloud API does not provide user email.

You can find how to change the authentication from [devise wiki](https://github.com/plataformatec/devise/wiki).



