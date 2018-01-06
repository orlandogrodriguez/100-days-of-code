# #100DaysOfCode Log - Round 1 - Orlando G. Rodriguez

The log of my #100DaysOfCode challenge. Started on [January 2, Tuesday, 2018].

## Log

### R1D1 - January 1, 2018
I am very happy to take part in the 100DaysOfCode challenge! I got very excited and started coding before reading all of the instrutions. I created a different repository for the challenge be fore I realized I could simply fork this repository. Nevertheless, I tried to pick up on an old iOS project. I struggled a bit with the sloppy code I had written before, so I'll start from scratch once again tomorrow.

### R1D2 - January 2, 2018
I had already started the 100 days of code challenge, but today I forked the official repository for the challenge and I'm finally adhering to the official rules. Also, I started the project I was working on from scratch. I started working on a simple iOS project I've been meaning to work on for some time now. It's titled "Swayter". This is going to be a simple app that sends its users notifications stating how many layers to wear on a given day. This will be determined by the thresholds set up by the user.

Today, I created the TemperatureThreshold object description. I'll probably make some changes to it, but I'm going to wrap it up for the day. I'm looking forward to tomorrow!

Link to my work: [Swayter](https://github.com/orlandogrodriguez/100-days-of-code/tree/master/iOS/Swayter)

### R1D3 - January 3, 2018
Today I decided to tackle user authentication with facebook. I was working on facebook authentication for "Swayter", but I got stuck. Facebook's documentation for login and authentication does not have a Swift version, only Objective-C. I'll tackle this again tomorrow.

Link to my work: [Swayter](https://github.com/orlandogrodriguez/100-days-of-code/tree/master/iOS/Swayter)

### R1D4 - January 4, 2018
After a while struggling with facebook's user authentication for swift 4, I was finally able to make it work. It turns out I simply needed to give the project a build right after installing the facebook sdk using cocoapods. After doing so, I was able to import the necessary frameworks. I created a button that allows the user to log in using their facebook credentials.

Link to my work: [Swayter](https://github.com/orlandogrodriguez/100-days-of-code/tree/master/iOS/Swayter)

### R1D5 - January 5, 2018
For day 5 of this challenge, I worked on one simple task for Swayter. I used the CoreLocation framework to obtain the user's coordinates. With these coordinates, I'll be able to obtain weather data. I have yet to figure out what weather API I can use to obtain this information. It shouldn't be that much of a challenge.

Link to my work: [Swayter](https://github.com/orlandogrodriguez/100-days-of-code/tree/master/iOS/Swayter)

### R1D6 - January 6, 2018
I made a lot of progress today. Somehow it has taken me so long to find out about Alamofire; an excellent library for iOS networking solutions. I registered an account with the DarkSky API, a nice API that provides weather data for any location. I used the latitude and longitude values I found yesterday using CoreLocation in order to obtain all sorts of weather data from DarkSky using Alamofire.

Tomorrow I'll work on parsing all of this data into a usable format as well as starting to give the app some structure.

Link to my work: Link to my work: [Swayter](https://github.com/orlandogrodriguez/100-days-of-code/tree/master/iOS/Swayter)
