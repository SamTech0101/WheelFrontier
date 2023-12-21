String mapintToStatus(int intStatus) {
  switch (intStatus) {
    case 1:
      return 'Not Seen';
    case 2:
      return 'Seen';
    case 3:
      return 'Followed';
    default:
      return '';
  }
}