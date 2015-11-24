## breadCrumbs
*And Hansel said to Gretel, 'Let us drop these bread crumbs so that together we find our way home…'*

![Main map](/breadCrumbs-photos/IMG_2378.JPG)
![New crumb](/breadCrumbs-photos/IMG_2383.JPG)

**Note**: This repo is for the breadCrumbs backend server and database. There is a [separate repo](https://github.com/Salt7900/breadcrumbs) for its frontend work, written in Swift.

breadCrumbs is a Dev Bootcamp Phase 3 final project by three students from the 2015 Chicago Purple Martins. It was created over a period of 8 days in November 2015.

**Team breadCrumbs**:
* [Jen Trudell](https://github.com/jtrudell)
* [Ben Fallon](https://github.com/Salt7900)
* [Katelyn Dinkgrave](https://github.com/dinkengraven)

breadCrumbs is an iOS app written in Swift with a backend server written in Ruby on Rails. In its simplest form, breadCrumbs allows a user to leave themselves a note and a photo at a specific location. When the user visits this location in the real world, they receive a notification that they have a breadCrumb to view.

One example may be a shopping reminder. I could leave myself a breadCrumb at Trader Joe's with a reminder to buy cereal, and then include a photo of my favorite cereal. The next time I walk into Trader Joe's, my phone will send me a notification that leads to my breadCrumb.

A user can also leave a breadCrumb for a friend, and this was our true goal for the app. By entering a friend's email address, you can leave a breadcrumb with a photo anywhere in the world. Once your friend arrives at that geolocation, they can open the app to view your photo and message. It's a little bit of Geocaching with a dash of Snapchat.

### About the breadCrumbs server
#### Environment:
  - Ruby v 2.2.1
  - Rails v 4.2.4

#### Gem dependencies:
  - [paperclip](https://github.com/thoughtbot/paperclip) (file uploads)
  - [aws-sdk](https://github.com/aws/aws-sdk-ruby) (Amazon Web Services)
  - [puma](https://github.com/puma/puma) (web server)

#### Process:
This server was initially written on Sinatra for proof-of-concept (communication with iOS frontend). We quickly discovered that while this worked, it would be riddled with security holes, more difficult to maintain, and ultimately more trouble than it was worth. So on the third day of the project, the server was re-written in Rails in order to allow for better security and easier integration with paperclip.

Unfortunately, due to the time constraint of this project, a TDD approach was not feasible. We are adding more tests to this project as time allows.

#### Special thanks:
  - Angela Chien for providing the concept of breadCrumbs when we crowd-sourced Facebook for app ideas.
  - Dev Bootcamp Chicago staff, especially [Casey](https://github.com/case-eee) for her tireless support and Erin for giving us the name breadCrumbs.
  - [Alec](https://github.com/xionon) for his technical assistance.
