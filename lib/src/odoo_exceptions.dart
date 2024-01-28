/// Odoo exceptions thrown by Odoo client

/// Generic exception thrown on error coming from Odoo server.
class OdooException implements Exception {
  /// Exception message coming from Odoo server.
  Map<String, dynamic> error;
  OdooException(this.error);

  @override
  String toString() {
    var errorData = OdooExceptionErrorData.fromJson(error['data']);
    return errorData.toString();
  }
}

class OdooAuthenticationException implements Exception {
  OdooAuthenticationException() : super();

  @override
  String toString() {
    return '验证失败';
  }
}

/// Exception for session expired error.
class OdooSessionExpiredException implements Exception {
  /// Exception message coming from Odoo server.
  String error;
  OdooSessionExpiredException(this.error);

  @override
  String toString() => 'OdooSessionExpiredException: $error';
}

class OdooExceptionErrorData {
  OdooExceptionErrorData({
    required this.debug,
    required this.message,
    required this.name,
  });

  factory OdooExceptionErrorData.fromJson(Map<String, dynamic> json) =>
      OdooExceptionErrorData(
        debug: json['debug'],
        message: json['message'],
        name: json['name'],
      );

  final String debug;
  final String message;
  final String name;

  Map<String, dynamic> toJson() => {
        'debug': debug,
        'message': message,
        'name': name,
      };

  @override
  String toString() => message;
}
