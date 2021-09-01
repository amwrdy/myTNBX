class ApiResponse<T> {
  States state;

  T data;

  String message;
  bool status;

  ApiResponse.loading(this.message) : state = States.LOADING;

  ApiResponse.completed(this.data) : state = States.COMPLETED;
  //ApiResponse.completedWithMsg(this.message) : state = States.COMPLETED;
  ApiResponse.completedWithMsg({this.status, this.message}) : state = States.COMPLETED_WITH_MSG;

  ApiResponse.error(this.message) : state = States.ERROR;
  ApiResponse.reset() : state = States.RESET;

  @override
  String toString() {
    return "States : $state \n Message : $message \n Data : $data";
  }
}

enum States { LOADING, COMPLETED, COMPLETED_WITH_MSG, ERROR, RESET}
