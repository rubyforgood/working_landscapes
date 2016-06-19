## List of things that need to be cleaned up:

### 3rd party libraries
* track versions of vendored libraries
* move stuff out of vendor into a packaging tool like `torba` or `rails-assets`
* application.js|css refer to libraries haphazardly
* `public/fonts/` is not where font-awesome fonts should live

### UI cleanup
* Form confirmation button is gone-zo

### Data cleanup
Lat/long fixtures have one value, corresponing protocol is made with 2 to be more sane
