# URLockBox

This app allows users to create an account and store links. It uses:

`Rails 5.0.0.1`

`Ruby 2.3.0`

A user, once logged in can add new links with a valid url and a title (a link must have both). A user can also update the link, mark as read or unread and filter. Filters include showing only read links, only unread links, or typing in to a filter that looks for matches in both the title and the url of the link.

Production site: https://salty-ravine-23588.herokuapp.com/

### Setup
1. clone this repo
2. bundle
3. run `rake db:setup` in the command line
4. run `rspec`
  - note: Some of the tests use Selenium to test javascript features. In order to to use Selenium you must have Firefox version 46, other versions of Firefox may not work with this test suite.

### Api
This repo includes one RESTful api endpoint for links.

PUT `/api/v1/links` which takes link params which must include a valid URL (includes http/https) and a title for the link.  

### Hot Reads Service

URL Lock Box works in conjunction with Hot Reads to identify "hot links" - the top 10 most-read links

Hot Reads repo: https://github.com/caward12/hot_reads

Hot Reads production:

#### Final Assessment

The URLockbox is the final assessment for module 4 of the backend engineering program at Turing School of Software and Design.


