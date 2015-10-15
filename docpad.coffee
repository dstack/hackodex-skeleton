# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration

dtDisplayFormat = 'dddd, MMMM Do YYYY, h:mm a (z)';

agendaDisplayFormat = 'h:mm a';

moment = require('moment-timezone');

agenda = [];
try
	agenda = require('./agenda');
catch e
	agenda = [];

currentTZOffset = new Date().getTimezoneOffset();

docpadConfig = {
	templateData: {
		agenda: agenda,
		event: {
			eventName: 'Hackodex',
			start: '2015-08-08 09:30',
			end: '2015-08-13 00:00',
			tz: 'America/Denver',
			shortDescription: 'Changing the World with Technology, Ideas, &amp; Hard Work.',
			location: {
				display: '<b>Pearson eCollege Headquarters</b><br/>2154 E. Commons Avenue, Suite 4000,<br/>Centennial, CO 80122',
				showMap: true,
				mapCenter:'2154+E+Commons+Ave,Centennial,CO,80122',
				markers: [
					{
						at: '2154+E+Commons+Ave,Centennial,CO,80122',
						color: 'green',
						label: 'P'
					}
				],
				zoom: 13
			}
		}
		docTitle: ->
			return (if @document.docTitle then @document.docTitle else ( if @document.title then @document.title else @event.eventName)) + ' | ' + @event.eventName;
		evtStartDateTimeDisplay: ->
			dateWithOffset = moment(@event.start);
			return dateWithOffset.tz(@event.tz).format(dtDisplayFormat);
		evtEndDateTimeDisplay: ->
			dateWithOffset = moment(@event.end);
			return dateWithOffset.tz(@event.tz).format(dtDisplayFormat);
		agendaDateFormat: (v) ->
			dateWithOffset = moment(v);
			return dateWithOffset.tz(@event.tz).format(agendaDisplayFormat);
		tzOnly: ->
			return moment().tz(@event.tz).format('z');
		currentYear: ->
			return moment().format('YYYY');
		getMapImg: ->
			markerStr = '';
			for i in [0..@event.location.markers.length-1]
				marker = @event.location.markers[i];
				loc = encodeURI(marker.at);
				color = marker.color || 'green';
				label = marker.label || '';
				markerStr += '&markers=color:' + color + '%7Clabel:' + label + '%7C' + loc

			return 'https://maps.googleapis.com/maps/api/staticmap?center=' + @event.location.mapCenter + markerStr + '&zoom=' + @event.location.zoom + '&scale=2&size=1280x250&maptype=roadmap';
	}
}

# Export the DocPad Configuration
module.exports = docpadConfig
