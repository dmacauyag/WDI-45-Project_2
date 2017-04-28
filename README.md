# **VidLinkz**

A web application created for users to save their favorite web videos.

Click on <a href="http://vast-coast-77555.herokuapp.com">VidLinkz</a> to view the app.

## How It Works:
After clicking the link above, click on "Sign Up" at the top right of the page to create a new account. 

Once your new account is created, you're ready to start using the app! All of your folders are located on the left. Click on "Add Folder" in order to create new folders. To begin adding videos, click "Add Video". At the moment, this application only supports videos from Youtube. Be sure to enter a valid url in order to add your video. 

Each video has the option of being edited, deleted, or added to a folder. Click on the links to your folders, located on the left, in order to view all of the videos added to that particular folder. Within this page, you have the option of renaming the folder, deleting the folder or removing videos from the folder. Click on "VidLinkz" located at the top left at anytime in order to go back to your personal home page containing all your saved videos.

## Development and Technologies
VidLinkz was built using the following:

* HTML
* CSS
* JavaScript
* Ruby
* jQuery Library
* Bootstrap front-end framework
* Ruby on Rails web application framework

## User Stories
* As a user, I want to be able to easily save my favorite videos from the web so I can view and access them all from one location. 
* As a user, I want a way to organize my saved videos so that I can easily categorize them for viewing.  
* As a user, I want a simple interface that is clear to use and easy to navigate.
* As a user, I want a website that is easy to use so that I can quickly add a video without having to go through too much hassle. 

## Wireframes
![Imgur](http://i.imgur.com/LgZyUIK.png)
![Imgur](http://i.imgur.com/4oJRWAp.png)
![Imgur](http://i.imgur.com/Z931crb.png)

## MVP
* Implement three models: users, videos, and folders. 
* Include sign up / log in functionality with encrypted passwords as well as validation for duplicate usernames or email addresses. 
* Implement complete RESTful routes for the video model. 
* Users can add videos from Youtube by providing the video url.
* Users can create folders and choose if they want to add their saved videos into those folders. 


## Features For the Future
* Implement additional support for other popular video sites such as Vimeo.  
* Implement a way to search for and "follow" other users in order to view their saved videos.
* Develop a custom logo for the VidLinkz name. 
* Implement a way for users to add their own profile picture. 
* Develop the landing page to include a custom background image and logo.
* Develop and customize the styles used throughout the site. 
* Users and folders can be created, edited or deleted.


## Acknowledgments 
Background image from <a href="https://pixabay.com/en/vcr-video-tapes-movie-old-retro-1221156/">Pixabay</a>.


The method I used (see below) to parse out the ID from a provided Youtube url and generate the url for the iframe was based off of code found on    <a href="http://stackoverflow.com/questions/5909121/converting-a-regular-youtube-link-into-an-embedded-video">Stack Overflow</a>.

```
def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    return "http://www.youtube.com/embed/#{ youtube_id }"
  end

