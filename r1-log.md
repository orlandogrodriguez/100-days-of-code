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

### R1D7 - January 7, 2018
This is the 1 week mark of the challenge! I feel like I've made a lot of progress on this project. I hit a roadblock today trying to create a custom table-view cell for my app. However, I've found the resources that will allow me to tackle this first thing tomorrow.

Custom TableView Cells Tutorial: [Custom TableView Cells](https://www.youtube.com/watch?v=zAWO9rldyUE)

After a while of working on this, I explored the new tools for parsing and serializing JSON using Swift 4. I learned about Swift4's JSONDecoder, and how easy it is to use. I found a nice tutorial for this as well.

Link to JSON Parsing Tutorial: [JSON Parsing](https://www.youtube.com/watch?v=YY3bTxgxWss)

And as always, here's the link to my work. It looks like I'll make lots of good progress tomorrow!

Link to my work: Link to my work: [Swayter](https://github.com/orlandogrodriguez/100-days-of-code/tree/master/iOS/Swayter)

### R1D8 - R1D10 - January 10, 2018
Finally, I made lots of progress on parsing the JSON data. I was able to acquire the low temperature for the day. This is the one most important piece of data that I needed to drive the functionality of the application. With this out of the way, now I have to work with the way the app is structured.

Link to my work: Link to my work: [Swayter](https://github.com/orlandogrodriguez/100-days-of-code/tree/master/iOS/Swayter)

### R1D11 - January 11, 2018
I was very excited to get some refactoring work done. It finally seems like I'm working on the app and not just testing out one thing or the other. Unfortunately, it seems that a big refactoring bug remains. I'm unable to add new outlets without having the program crash. I may have a workaround, but it'll take me some time. I'll try this tomorrow.

Link to my work: Link to my work: [Swayter](https://github.com/orlandogrodriguez/100-days-of-code/tree/master/iOS/Swayter)

### R1D12 - January 12, 2018
Slowly but surely, this app is taking some form. I was finally able to fix that huge refactoring bug I created when I renamed the files for convenience. Well... it seems like i've learned my lesson. It's not smart to mess around with filenames on xcode.

I was finally able to create a UILabel as an IBOutlet without having the app crash on me. Moreover, the app displays the low temperature forecast for the current day. The app doesn't look like much yet, but this is actually a very big step. There is a lot that is still missing, but very soon this app will be a finished product. I won't give up!

Link to my work: [Swayter](https://github.com/orlandogrodriguez/100-days-of-code/tree/master/iOS/Swayter)
