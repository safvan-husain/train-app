class Helper {
  static String formatDate(DateTime dateTime) {
    // List of months to map the month index to the month name
    List<String> months = [
      "", // Index 0 is not used
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];

    // Extract day, month, and year from the DateTime object
    int day = dateTime.day;
    int monthIndex = dateTime.month;
    String monthName = months[monthIndex];
    int year = dateTime.year;

    // Construct the formatted string
    String formattedDate = "$day $monthName $year";

    return formattedDate;
  }
}
