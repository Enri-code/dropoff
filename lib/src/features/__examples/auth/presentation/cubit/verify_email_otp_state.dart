part of 'verify_email_otp_cubit.dart';

enum VerifyOtpStatus {
  initial,
  // waiting,
  loading,
  success,
  failed,
}

class EmailOtpState extends Equatable {
  final int countdown;
  final VerifyOtpStatus status;
  final AppError? error;

  const EmailOtpState(this.countdown, this.status, this.error);

  factory EmailOtpState.initial() =>
      const EmailOtpState(0, VerifyOtpStatus.initial, null);

  EmailOtpState copyWith({
    int? countdown,
    VerifyOtpStatus? status,
    AppError? error,
  }) {
    return EmailOtpState(
      countdown ?? this.countdown,
      status ?? this.status,
      error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [countdown, status];
}
