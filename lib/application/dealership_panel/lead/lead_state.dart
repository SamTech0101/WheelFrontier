part of 'lead_bloc.dart';

@immutable
abstract class LeadState {}

class LeadInitial extends LeadState {}

class LeadSuccess extends LeadState {
  final List leads;
  LeadSuccess({
    @required this.leads,
  });

  LeadSuccess copyWith({
    List leads,
  }) {
    return LeadSuccess(
      leads: leads ?? this.leads,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'leads': leads,
    };
  }

  factory LeadSuccess.fromMap(Map<String, dynamic> map) {
    return LeadSuccess(
      leads: List.from(map['leads']),
    );
  }

  @override
  String toString() => 'LeadPageSuccess(leads: $leads)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LeadSuccess && listEquals(other.leads, leads);
  }

  @override
  int get hashCode => leads.hashCode;
}

class LeadFailure extends LeadState {}
