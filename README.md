# slickgrid-bootstrap-rails

SlickGrid rails integration with Bootstrap support.

Integrates mleibman/SlickGrid into your rails app.
SlickGrid is a superb editable grid, but integration into Rails was
a bit messy and jQuery UI themes didn't always look too great.   With this gem,
you can

* Fixes hardcoded pathing in SlickGrid that breaks Rails asset pipeline
* Eases jquery.drag.drag/drop integration (with akiatoji/jquery-dragdrop-rails)
* Requires less based integration with Bootstrap (with seyhunak/twitter-bootstrap-rails)
* Bootstrap styling with minimal markup changes (credits to reeblazs/SlickGrid-touch)

## Installation

Add this line to your application's Gemfile:

```
gem 'slickgrid-bootstrap-rails'
```

Then execute:

```
$ bundle
```


## Usage

Pre-requisite
-------------

SlickGrid uses jQuery UI so you need it in your assets.
slickgrid-bootstrap-rails doesn't have any direct support to pull-in jQuery UI.
This is so that you can add themed jQuery UI assets yourself.

Alternatively, you can use joliss/jquery-ui-rails.


In your bootstrap enabled Rails app:
====================================

application.js
--------------
Bring in SlickGrid
```
//= require slickgrid-bootstrap-rails
```

application.css
---------------
Bring in SlickGrid styles

```
/*= slickgrid-bootstrap-rails
```

bootstrap_and_overrides.css.less
--------------------------------
Enable Bootstrap styling for SlickGrid.

```
@import "slickgrid-bootstrap";
```




In your HTML
-----------------

```HTML
<div id="myGrid" class="bootstrap-slickgrid" style="height: 400px"></div>
```

The class bootstrap-slickgrid applies Bootstrap styling.
You can leave it off if you just want jQuery UI theme.


Sample CoffeeScript that populates above grid:

```coffeescript
formatter = (row, cell, value, columnDef, dataContext) ->
  value
grid = undefined
data = []
columns = [
  id: "title"
  name: "Title"
  field: "title"
  minWidth: 30
  formatter: formatter
,
  id: "duration"
  name: "Duration"
  field: "duration"
  minWidth: 30
,
  id: "%"
  name: "% Complete"
  field: "percentComplete"
  width: 100
  resizable: false
  formatter: Slick.Formatters.PercentCompleteBar
,
  id: "start"
  name: "Start"
  field: "start"
  minWidth: 60
,
  id: "finish"
  name: "Finish"
  field: "finish"
  minWidth: 60
,
  id: "effort-driven"
  name: "Effort Driven"
  sortable: false
  width: 120
  minWidth: 60
  maxWidth: 120
  cssClass: "cell-effort-driven"
  field: "effortDriven"
  formatter: Slick.Formatters.Checkmark
]
options =
  enableCellNavigation: true
  enableColumnReorder: false
  forceFitColumns: true
  rowHeight: 35

$ ->
  i = 0
  while i < 5
    d = (data[i] = {})
    d["title"] = "<a href='#' tabindex='0'>Task</a> " + i
    d["duration"] = "5 days"
    d["percentComplete"] = Math.min(100, Math.round(Math.random() * 110))
    d["start"] = "01/01/2009"
    d["finish"] = "01/05/2009"
    d["effortDriven"] = (i % 5 is 0)
    i++
  grid = new Slick.Grid("#myGrid", data, columns, options)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Bootstrap integration is from reeblazs/SlickGrid-touch
