# Stomach

## What the heck?
Stomach is a message digesting API server. Really it's just a demonstration on how one could implement one.
It does in fact work though, so you can try it out if you'd like.

So what does it do? Easy, it exposes a very simple API to your other applications which they can use to handle
message delivery. This works great if you only send farily simple notifications as this app could contain
all of your "branding" and be a single piece to update those things. Also, since this is implemented asynchronously
it should improve the speed of your application.

## Usage
Start the app using a thread-capable version of Ruby 1.9 (preferably RBX or jRuby, I developed against jRuby).
Then POST or GET to the root URL with the following parameters:

  * recipient -> the email address you would like to get this message
  * subject -> The subject of the message. If this message gets sent by itself it will be the email subject.
  * message -> The body of the message in plain text. I might change this to be markdown in the future.

Optionally, you can pass the "instant" parameter and the system will immediately send your message.

## How are the digests sent?
Messages are stored in a database table that is polled once per minute for any unsent messages over 15 minutes old.
It then collects up the emails of those messages and sends all outstanding mails to them. This occurs in a background
thread so as long as it hasn't crashed you don't need to do anything.
