class FeedbackForm {

  String _feedback;


  FeedbackForm(this._feedback);

  // Method to make GET parameters.
  String toParams() =>
      "?feedback=$_feedback";


}