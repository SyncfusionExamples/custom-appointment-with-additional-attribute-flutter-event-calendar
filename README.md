# How to add additional attributes in events in the Flutter Calendar?

A quick-start example to help you to add additional attributes in events in the Flutter Calendar.

You can add additional attributes to events in the Flutter event calendar by using custom appointments.

Create a custom class Meeting with required fields to add custom appointments. We must require two mandatory DateTime fields for event start and end times. The id property was added as an extra in this example. 

Then, using the CalendarDataSource override method properties, map the Meeting class properties to the calendar. Then, using the Meeting class's properties and the newly added properties, you can schedule an appointment for that day. Implement the onTap callback of the Flutter calendar to obtain the newly added property details and display them in the alert window.


## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).