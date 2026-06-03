/// Matches the API `role` enum: TOURIST, RECEPTIONIST, COORDINATOR, GUIDE, ADMIN
enum AccountRole { tourist, coordinator, guide, receptionist, admin }

/// Matches the API `status` enum: ACTIVE, PENDING, DELETED, BANNED
enum AccountStatus { active, pending, deleted, banned, inactive }

class BusinessAccount {
  const BusinessAccount({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    this.avatarUrl,
    this.phoneNumber,
    this.createdAt,
  });

  final String id;
  final String name;
  final String email;
  final AccountRole role;
  final AccountStatus status;
  final String? avatarUrl;
  final String? phoneNumber;
  final String? createdAt;

  /// Creates a copy with updated fields.
  BusinessAccount copyWith({
    String? name,
    String? email,
    AccountRole? role,
    AccountStatus? status,
    String? avatarUrl,
    String? phoneNumber,
    String? createdAt,
  }) {
    return BusinessAccount(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      status: status ?? this.status,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Parse API status string to [AccountStatus].
  static AccountStatus statusFromApi(String? value) {
    switch (value?.toUpperCase()) {
      case 'ACTIVE':
        return AccountStatus.active;
      case 'PENDING':
        return AccountStatus.pending;
      case 'DELETED':
        return AccountStatus.deleted;
      case 'BANNED':
        return AccountStatus.banned;
      default:
        return AccountStatus.active;
    }
  }

  /// Parse API role string to [AccountRole].
  static AccountRole roleFromApi(String? value) {
    switch (value?.toUpperCase()) {
      case 'TOURIST':
        return AccountRole.tourist;
      case 'RECEPTIONIST':
        return AccountRole.receptionist;
      case 'COORDINATOR':
        return AccountRole.coordinator;
      case 'GUIDE':
        return AccountRole.guide;
      case 'ADMIN':
        return AccountRole.admin;
      default:
        return AccountRole.guide;
    }
  }

  /// Convert [AccountStatus] to API string.
  static String statusToApi(AccountStatus status) {
    switch (status) {
      case AccountStatus.active:
        return 'ACTIVE';
      case AccountStatus.pending:
        return 'PENDING';
      case AccountStatus.deleted:
        return 'DELETED';
      case AccountStatus.banned:
        return 'BANNED';
      case AccountStatus.inactive:
        return 'BANNED';
    }
  }

  /// Convert [AccountRole] to API string.
  static String roleToApi(AccountRole role) {
    switch (role) {
      case AccountRole.tourist:
        return 'TOURIST';
      case AccountRole.receptionist:
        return 'RECEPTIONIST';
      case AccountRole.coordinator:
        return 'COORDINATOR';
      case AccountRole.guide:
        return 'GUIDE';
      case AccountRole.admin:
        return 'ADMIN';
    }
  }
}
