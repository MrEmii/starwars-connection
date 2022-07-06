abstract class DTO<T> {
  final int status;
  final String message;

  int? count;
  String? next;
  String? previous;
  T? results;

  DTO(
    this.status,
    this.message, {
    this.count,
    this.next,
    this.previous,
    this.results,
  });
}
