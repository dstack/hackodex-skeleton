# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration

moment = require('moment');

docpadConfig = {
	templateData: {
		event: {
			start: '2013-02-08 09:30',
			end: '2013-02-12 00:00'
		}
		evtStartDate: ->
			return moment(@event.start).format("dddd, MMMM Do YYYY, h:mm:ss a");
	}
}

# Export the DocPad Configuration
module.exports = docpadConfig
