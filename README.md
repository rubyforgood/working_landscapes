# Virginia Working Landscapes

Virginia Working Landscapes (VWL) collects real data about the state and health of local ecosystems. 
Volunteers from across the state survey plant and wildlife, providing a wealth of information for scientists and researchers.
How are native bird populations faring? Are invasive plant life threatening local populations? 
The citizen scientists -- VWL's volunteers who survey land throughout the state -- collect data that could be early indicators of important trends on how all the life around us is faring.
VWL has put a lot of hard work in fostering an organization that brings in all this information.
Sadly, it's tough to process any of that data with the tools they have.

That's where you, the Ruby for Good attendee comes in.

Virginia Working Landscapes wants help with how their staff collects all the information provided by volunteers. 
They deserve a better reporting and analysis system so they can pull meaningful results out of their years of survey information.

I'd like to see VWL after Ruby for Good have an application that can provide them with years of insights they would struggle to see otherwise.

## Application Structure

See the [GitHub wiki](github.com/rubyforgood/working_landscapes/wiki/) for this project for more information about application structure.

## Installation and Deployment Notes

This is a Ruby on Rails app that uses Postres-specific features such as hstore. Any version of Postgres that supports hstore fields should be sufficient. Ruby and Rails versions are specified in the project's `.ruby-version` and `Gemfile`.
