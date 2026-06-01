import 'package:flutter/material.dart';
import 'package:travery_frontend/data/repositories/authentication/auth_repository.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileService _profileService;
  final SecurityStorageService _securityStorageService;
  final AuthRepository _authRepository;

  ProfileViewModel({
    required ProfileService profileService,
    required SecurityStorageService securityStorageService,
    required AuthRepository authRepository,
  }) : _profileService = profileService,
       _securityStorageService = securityStorageService,
       _authRepository = authRepository {
    loadProfile = Command0<ProfileData>(_loadProfile);
    updateProfile = Command0<ProfileData>(_updateProfile);
    updateAvatar = Command0<ProfileData>(_updateAvatar);
    changePassword = Command0<void>(_changePassword);
    deleteAccount = Command0<void>(_deleteAccount);
    logout = Command0<void>(_logout);
  }

  late final Command0<ProfileData> loadProfile;
  late final Command0<ProfileData> updateProfile;
  late final Command0<ProfileData> updateAvatar;
  late final Command0<void> changePassword;
  late final Command0<void> deleteAccount;
  late final Command0<void> logout;

  ProfileData? _profile;
  String? _errorMessage;
  bool _isSuccess = false;
  bool _isUpdateSuccess = false;

  // Form fields for edit profile
  String? _fullName;
  String? _phoneNumber;
  String? _passportNumber;
  String? _dateOfBirth;
  String? _gender;

  // Password fields
  String? _currentPassword;
  String? _newPassword;
  String? _confirmPassword;

  // Getters
  ProfileData? get profile => _profile;
  bool get isLoading =>
      loadProfile.running || updateProfile.running || updateAvatar.running;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;
  bool get isUpdateSuccess => _isUpdateSuccess;
  String? get fullName => _fullName;
  String? get phoneNumber => _phoneNumber;
  String? get passportNumber => _passportNumber;
  String? get dateOfBirth => _dateOfBirth;
  String? get gender => _gender;

  // Setters
  void setFullName(String? value) => _fullName = value;
  void setPhoneNumber(String? value) => _phoneNumber = value;
  void setPassportNumber(String? value) => _passportNumber = value;
  void setDateOfBirth(String? value) => _dateOfBirth = value;
  void setGender(String? value) => _gender = value;
  void setCurrentPassword(String? value) => _currentPassword = value;
  void setNewPassword(String? value) => _newPassword = value;
  void setConfirmPassword(String? value) => _confirmPassword = value;

  Future<Result<ProfileData>> _loadProfile() async {
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      final token = await _securityStorageService.getAccessToken();
      if (token == null || token.isEmpty) {
        _errorMessage = 'No access token found';
        notifyListeners();
        return Result.error(Exception(_errorMessage));
      }

      final result = await _profileService.getProfile(accessToken: token);
      switch (result) {
        case Ok<ProfileData>():
          _profile = result.value;
          _fullName = result.value.fullName;
          _phoneNumber = result.value.phoneNumber;
          _gender = 'MALE';
          _isSuccess = true;
          notifyListeners();
          return Result.ok(result.value);
        case Error<ProfileData>():
          _errorMessage = result.error.toString();
          notifyListeners();
          return Result.error(result.error);
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<ProfileData>> _updateProfile() async {
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      final token = await _securityStorageService.getAccessToken();
      if (token == null || token.isEmpty) {
        _errorMessage = 'No access token found';
        notifyListeners();
        return Result.error(Exception(_errorMessage));
      }

      final role = await _securityStorageService.getUserRole();
      Result<ProfileData> result;

      if (role == 'ROLE_ADMIN' ||
          role == 'ROLE_COORDINATOR' ||
          role == 'ROLE_GUIDE' ||
          role == 'ROLE_RECEPTIONIST') {
        result = await _profileService.updateAdminProfile(
          accessToken: token,
          fullName: _fullName,
          phoneNumber: _phoneNumber,
        );
      } else {
        result = await _profileService.updateTouristProfile(
          accessToken: token,
          fullName: _fullName,
          phoneNumber: _phoneNumber,
          passportNumber: _passportNumber,
          dateOfBirth: _dateOfBirth,
          gender: _gender,
        );
      }

      switch (result) {
        case Ok<ProfileData>():
          _profile = result.value;
          _isUpdateSuccess = true;
          notifyListeners();
          return Result.ok(result.value);
        case Error<ProfileData>():
          _errorMessage = result.error.toString();
          notifyListeners();
          return Result.error(result.error);
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<ProfileData>> _updateAvatar() async {
    _errorMessage = 'Vui lòng chọn ảnh trước';
    notifyListeners();
    return Result.error(Exception(_errorMessage));
  }

  Future<Result<ProfileData>> updateAvatarFile(String filePath) async {
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      final token = await _securityStorageService.getAccessToken();
      if (token == null || token.isEmpty) {
        _errorMessage = 'No access token found';
        notifyListeners();
        return Result.error(Exception(_errorMessage));
      }

      final result = await _profileService.updateAvatar(
        accessToken: token,
        filePath: filePath,
      );

      switch (result) {
        case Ok<ProfileData>():
          _profile = result.value;
          _isSuccess = true;
          notifyListeners();
          return Result.ok(result.value);
        case Error<ProfileData>():
          _errorMessage = result.error.toString();
          notifyListeners();
          return Result.error(result.error);
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<void>> _changePassword() async {
    if (_currentPassword == null || _currentPassword!.isEmpty) {
      _errorMessage = 'Vui lòng nhập mật khẩu hiện tại';
      notifyListeners();
      return Result.error(Exception(_errorMessage));
    }

    if (_newPassword == null || _newPassword!.isEmpty) {
      _errorMessage = 'Vui lòng nhập mật khẩu mới';
      notifyListeners();
      return Result.error(Exception(_errorMessage));
    }

    if (_newPassword!.length < 8) {
      _errorMessage = 'Mật khẩu mới phải có ít nhất 8 ký tự';
      notifyListeners();
      return Result.error(Exception(_errorMessage));
    }

    if (_newPassword != _confirmPassword) {
      _errorMessage = 'Mật khẩu xác nhận không khớp';
      notifyListeners();
      return Result.error(Exception(_errorMessage));
    }

    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      final token = await _securityStorageService.getAccessToken();
      if (token == null || token.isEmpty) {
        _errorMessage = 'No access token found';
        notifyListeners();
        return Result.error(Exception(_errorMessage));
      }

      final result = await _profileService.changePassword(
        accessToken: token,
        currentPassword: _currentPassword!,
        newPassword: _newPassword!,
      );

      switch (result) {
        case Ok<void>():
          _isSuccess = true;
          _currentPassword = null;
          _newPassword = null;
          _confirmPassword = null;
          notifyListeners();
          return const Result.ok(null);
        case Error<void>():
          _errorMessage = result.error.toString();
          notifyListeners();
          return Result.error(result.error);
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<void>> _deleteAccount() async {
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      final token = await _securityStorageService.getAccessToken();
      if (token == null || token.isEmpty) {
        _errorMessage = 'No access token found';
        notifyListeners();
        return Result.error(Exception(_errorMessage));
      }

      final result = await _profileService.deleteAccount(accessToken: token);

      switch (result) {
        case Ok<void>():
          await _securityStorageService.deleteAllTokens();
          _isSuccess = true;
          notifyListeners();
          return const Result.ok(null);
        case Error<void>():
          _errorMessage = result.error.toString();
          notifyListeners();
          return Result.error(result.error);
      }
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<void>> _logout() async {
    _errorMessage = null;

    try {
      final refreshToken =
          await _securityStorageService.getRefreshToken() ?? '';
      final result = await _authRepository.logout(refreshToken: refreshToken);
      switch (result) {
        case Ok<void>():
          _isSuccess = true;
          return const Result.ok(null);
        case Error<void>():
          // Even on error, we want to clear tokens locally
          await _securityStorageService.deleteAllTokens();
          _isSuccess = true;
          return const Result.ok(null);
      }
    } catch (e) {
      await _securityStorageService.deleteAllTokens();
      _isSuccess = true;
      return const Result.ok(null);
    }
  }

  void clearMessages() {
    _errorMessage = null;
    _isSuccess = false;
    _isUpdateSuccess = false;
    notifyListeners();
  }

  void reset() {
    _profile = null;
    _errorMessage = null;
    _isSuccess = false;
    _fullName = null;
    _phoneNumber = null;
    _passportNumber = null;
    _dateOfBirth = null;
    _gender = null;
    _currentPassword = null;
    _newPassword = null;
    _confirmPassword = null;
    notifyListeners();
  }
}
