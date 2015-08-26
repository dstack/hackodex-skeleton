# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration

dtDisplayFormat = 'dddd, MMMM Do YYYY, h:mm a';

moment = require('moment');

docpadConfig = {
	templateData: {
		event: {
			start: '2015-08-08 09:30',
			end: '2015-08-12 00:00',
			eventName: 'Hackodex',
			shortDescription: 'Changing the World with Technology, Ideas, &amp; Hard Work.'
		}
		evtStartDateTimeDisplay: ->
			return moment(@event.start).format(dtDisplayFormat);
		evtEndDateTimeDisplay: ->
			return moment(@event.end).format(dtDisplayFormat);
		currentYear: ->
			return moment().format('YYYY')
	}
}

# Export the DocPad Configuration
module.exports = docpadConfig
