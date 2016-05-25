# pick-app
This is the server-side of our mobile app, Pick. This rails server is responsible for storing user information, interacting with SoundCloud's API to populate user profiles with their Soundcloud info, interacting with a zipcode API to determine user cities and filter out user search results by distance to the current user, forming user-to-user relationships (picks), and managing user genres and roles.
The server has a suite of RSpec tests written to ensure stability through future updates.
