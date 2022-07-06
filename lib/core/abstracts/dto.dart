abstract class ResponseDTO {
  final int status;
  final String message;

  ResponseDTO(this.status, this.message);
}

abstract class RequestDTO {
  Map<String, dynamic> toMap();
}
