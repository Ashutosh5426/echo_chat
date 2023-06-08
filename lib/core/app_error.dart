// import 'package:carema/core/common_widgets/common_flutter_toast.dart';
// import 'package:carema/core/resources/strings/app_localization.dart';
// import 'package:carema/core/resources/strings/app_string_constants.dart';
// import 'package:carema/core/services/api/app_exception.dart';
// import 'package:carema/core/services/api/exception_helper.dart';
// import 'package:carema/core/services/bloc/app_error_type.dart';
// import 'package:flutter/cupertino.dart';
//

// class AppError {
//
// }
// class AppError {
//   late AppErrorType _appErrorType;
//
//   AppError.withErrorModel(ErrorModel? errorModel) {
//     _appErrorType = _getErrorTypeFromErrorModel(errorModel);
//   }
//
//   AppError.withError({String? errorType}) {
//     _appErrorType = _getErrorType(errorType ?? '');
//   }
//
//   AppErrorType _getErrorTypeFromErrorModel(ErrorModel? errorModel) {
//     if (errorModel == null) {
//       return AppErrorType.unknownHandlingError;
//     }
//     var errorType = errorModel.responseStatusKey ?? errorModel.errorMessageKey;
//     return _getErrorType(errorType);
//   }
//
//   AppErrorType get getAppErrorType => _appErrorType;
//
//   AppErrorType _getErrorType(String errorType) {
//     if (errorType.trim().isNotEmpty) {
//       switch (errorType.trim().toUpperCase()) {
//         case kApiUnknownError:
//           return AppErrorType.unknownApiError;
//         case kApiCanceled:
//           return AppErrorType.canceledError;
//         case kApiConnectionTimeout:
//           return AppErrorType.connectionTimeOutError;
//         case kApiDefault:
//           return AppErrorType.defaultError;
//         case kApiReceiveTimeout:
//           return AppErrorType.receivedTimeOutError;
//         case kApiSendTimeout:
//           return AppErrorType.sendTimeoutCode;
//         case kApiResponseError:
//           return AppErrorType.responseError;
//         case invalidLanguage:
//           return AppErrorType.invalidLanguage;
//         case invalidPhoneNumber:
//           return AppErrorType.invalidPhoneNumber;
//         case invalidEncryptedData:
//           return AppErrorType.invalidEncryptedData;
//         case otpNotFound:
//           return AppErrorType.otpNotFound;
//         case invalidOtp:
//           return AppErrorType.invalidOtp;
//         case otpVerified:
//           return AppErrorType.otpVerified;
//         case otpExpired:
//           return AppErrorType.otpExpired;
//         case numberAlreadyExist:
//           return AppErrorType.numberAlreadyExist;
//         case anotherUserLoggedIn:
//           return AppErrorType.anotherUserLoggedIn;
//         case deletedUser:
//           return AppErrorType.deletedUser;
//         case tokenDecodeError:
//           return AppErrorType.tokenDecodeError;
//         case emailExist:
//           return AppErrorType.emailExist;
//         case anotherDeviceLoggedIn:
//           return AppErrorType.anotherUserLoggedIn;
//         case invalidCity:
//           return AppErrorType.invalidCity;
//         case invalidCountry:
//           return AppErrorType.invalidCountry;
//         case invalidPostalCode:
//           return AppErrorType.invalidPostalCode;
//         case insufficientStock:
//           return AppErrorType.insufficientStock;
//         case userInactive:
//           return AppErrorType.inactiveUser;
//
//       /// coupon error
//         case invalidPromoCode:
//           return AppErrorType.invalidPromoCode;
//         case saleDiscountApplied:
//           return AppErrorType.saleDiscountApplied;
//         case voucherNotApplied:
//           return AppErrorType.voucherNotApplied;
//         case giftCardNotApplied:
//           return AppErrorType.giftCardNotApplied;
//         case pollExpired:
//           return AppErrorType.pollExpired;
//
//       /// product stock reminder error codes
//         case invalidVariantId:
//           return AppErrorType.invalidVariantId;
//         case productStockReminderAlreadySubscribed:
//           return AppErrorType.productStockReminderAlreadySubscribed;
//         case productStockReminderAlreadyUnsubscribed:
//           return AppErrorType.productStockReminderAlreadyUnsubscribed;
//
//         case tokenMissing:
//         case tokenExpired:
//         case invalidSignature:
//         case tokenRequired:
//         default:
//           return AppErrorType.unknownHandlingError;
//       }
//     } else {
//       return AppErrorType.unknownHandlingError;
//     }
//   }
//
//   String handleAppError({BuildContext? context, isShowSnackBar = false}) {
//     var message = AppLocalizationKeys.defaultErrorMessage.translate;
//     switch (_appErrorType) {
//       case AppErrorType.unknownApiError:
//       case AppErrorType.canceledError:
//       case AppErrorType.connectionTimeOutError:
//       case AppErrorType.defaultError:
//       case AppErrorType.receivedTimeOutError:
//       case AppErrorType.sendTimeoutCode:
//       case AppErrorType.handshakeError:
//       case AppErrorType.responseError:
//       case AppErrorType.notAllowedError:
//       case AppErrorType.unknownHandlingError:
//       case AppErrorType.internalError:
//       case AppErrorType.noInternetConnection:
//         message = AppLocalizationKeys.defaultErrorMessage.translate;
//         break;
//       case AppErrorType.inactiveUser:
//         message = AppLocalizationKeys.inactiveAccountMsg.translate;
//         break;
//       case AppErrorType.invalidLanguage:
//         message = AppLocalizationKeys.invalidLanguage.translate;
//         break;
//       case AppErrorType.invalidPhoneNumber:
//         message = AppLocalizationKeys.invalidPhoneNumber.translate;
//         break;
//       case AppErrorType.invalidEncryptedData:
//         message = AppLocalizationKeys.invalidEncryptedData.translate;
//         break;
//       case AppErrorType.otpNotFound:
//         message = AppLocalizationKeys.otpNotFound.translate;
//         break;
//       case AppErrorType.invalidOtp:
//         message = AppLocalizationKeys.invalidOtp.translate;
//         break;
//       case AppErrorType.otpVerified:
//         message = AppLocalizationKeys.otpVerified.translate;
//         break;
//       case AppErrorType.otpExpired:
//         message = AppLocalizationKeys.otpExpired.translate;
//         break;
//       case AppErrorType.numberAlreadyExist:
//         message = AppLocalizationKeys.numberAlreadyExist.translate;
//         break;
//       case AppErrorType.deletedUser:
//         message = AppLocalizationKeys.reactivateAccountMsg.translate;
//         break;
//       case AppErrorType.anotherUserLoggedIn:
//         message = AppLocalizationKeys.anotherUserLoggedIn.translate;
//         break;
//       case AppErrorType.tokenDecodeError:
//         message = AppLocalizationKeys.tokenDecodeError.translate;
//         break;
//       case AppErrorType.emailExist:
//         message = AppLocalizationKeys.emailExist.translate;
//         break;
//       case AppErrorType.invalidCity:
//         message = AppLocalizationKeys.invalidCity.translate;
//         break;
//       case AppErrorType.invalidCountry:
//         message = AppLocalizationKeys.invalidCountry.translate;
//         break;
//       case AppErrorType.invalidPostalCode:
//         message = AppLocalizationKeys.invalidPostalCode.translate;
//         break;
//       case AppErrorType.insufficientStock:
//         message = AppLocalizationKeys.insufficientStock.translate;
//         break;
//       case AppErrorType.pollExpired:
//         message = AppLocalizationKeys.voteExpiredMessage.translate;
//         break;
//
//     /// coupon error
//       case AppErrorType.invalidPromoCode:
//         return AppLocalizationKeys.invalidPromoCode.translate;
//       case AppErrorType.saleDiscountApplied:
//         return AppLocalizationKeys.saleDiscountApplied.translate;
//       case AppErrorType.voucherNotApplied:
//         return AppLocalizationKeys.voucherNotApplied.translate;
//       case AppErrorType.giftCardNotApplied:
//         return AppLocalizationKeys.giftCardNotApplied.translate;
//
//     /// product stock reminder error codes mapping to error message
//       case AppErrorType.invalidVariantId:
//         return AppLocalizationKeys.defaultErrorMessage.translate;
//       case AppErrorType.productStockReminderAlreadySubscribed:
//         return AppLocalizationKeys
//             .productStockReminderAlreadySubscribed.translate;
//       case AppErrorType.productStockReminderAlreadyUnsubscribed:
//         return AppLocalizationKeys
//             .productStockReminderAlreadyUnsubscribed.translate;
//     }
//     if (isShowSnackBar && context != null) {
//       CommonShowToast.showToast(
//         message: message,
//         isError: true,
//         context: context,
//       );
//     }
//     return message;
//   }
// }