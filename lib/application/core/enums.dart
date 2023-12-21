const Date_Ascending = 'Ascending';
const Date_Descending = 'Descending';

const Seen_Status = 'Seen';
const UnSeen_Status = 'UnSeen';
const Responded_Status = 'Responded';

List statuses = [Seen_Status, UnSeen_Status, Responded_Status];

// for indicating api response from bloc and listeting to it from view
// to navigate or show dialogs,snackbars and etc...
// it will be null when the bloc first startrs to indicate we havent
// had any api call yet, and will be occupied with either exception catched
// in cathc bloc or success class down below

class ApiResponse {
  final dynamic response;
  ApiResponse({this.response});
}

// some dumb class for returning inside api response to indicate everythinhg
// went as planned
class Success {}
