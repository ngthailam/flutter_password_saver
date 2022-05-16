// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  static String m0(deviceSecureStorage) =>
      "qua sử dụng ${deviceSecureStorage} của thiết bị";

  static String m1(copiedText) => "Sao chép ${copiedText}";

  static String m2(accountName) => "Xoá mật khẩu cho [${accountName}]";

  static String m3(timeLock) =>
      "Đăng nhập quá nhiều lần, thử lại sau ${timeLock}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "answer": MessageLookupByLibrary.simpleMessage("Trả lời"),
        "benefit1Highlight1": MessageLookupByLibrary.simpleMessage("BẢO MẬT "),
        "benefit1Part1": MessageLookupByLibrary.simpleMessage(
            "Nơi lưu trữ tất cả mật khẩu của bạn một cách "),
        "benefit1Part2": m0,
        "benefit2Highlight1":
            MessageLookupByLibrary.simpleMessage("KHÔNG ĐƯỢC DÙNG "),
        "benefit2Part1":
            MessageLookupByLibrary.simpleMessage("Kết nối Internet "),
        "benefit2Part2": MessageLookupByLibrary.simpleMessage(
            "bạn có thể an tâm là mật khẩu không bị gửi đi bất cứ đâu"),
        "cancel": MessageLookupByLibrary.simpleMessage("Bỏ"),
        "choosePassword": MessageLookupByLibrary.simpleMessage(
            ", xin vui lòng chọn mật khẩu"),
        "confirm": MessageLookupByLibrary.simpleMessage("Xác nhận"),
        "congratulation": MessageLookupByLibrary.simpleMessage("Chúc mừng"),
        "congratulationSubtitle":
            MessageLookupByLibrary.simpleMessage("Bạn đã đăng ký thành công!"),
        "copied": m1,
        "delete": MessageLookupByLibrary.simpleMessage("Xoá"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Xoá tài khoản"),
        "edit": MessageLookupByLibrary.simpleMessage("Sửa"),
        "emptyPasswordHint":
            MessageLookupByLibrary.simpleMessage("Tạo mật khẩu đầu tiên"),
        "errorPassIncorrect":
            MessageLookupByLibrary.simpleMessage("Mật khẩu không hợp lệ"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Bắt đầu"),
        "hi": MessageLookupByLibrary.simpleMessage("Xin chào "),
        "keyChain": MessageLookupByLibrary.simpleMessage("KeyChain"),
        "keyStore": MessageLookupByLibrary.simpleMessage("KeyStore"),
        "langEn": MessageLookupByLibrary.simpleMessage("Tiếng Anh"),
        "langVn": MessageLookupByLibrary.simpleMessage("Tiếng Việt"),
        "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
        "nameInputError":
            MessageLookupByLibrary.simpleMessage("Tên không được để trống"),
        "nameInputHint": MessageLookupByLibrary.simpleMessage("Nhập tên bạn"),
        "nameInputTitle":
            MessageLookupByLibrary.simpleMessage("Tên bạn là gì?"),
        "noResults":
            MessageLookupByLibrary.simpleMessage("Không tìm thấy kết quả"),
        "passSaverHyphen": MessageLookupByLibrary.simpleMessage("PASS-SAVER"),
        "prefDarkMode": MessageLookupByLibrary.simpleMessage("Bật theme tối"),
        "prefRequireLogin": MessageLookupByLibrary.simpleMessage(
            "Yêu cầu mật khẩu khi đăng nhập"),
        "preferences": MessageLookupByLibrary.simpleMessage("Cài đặt"),
        "save": MessageLookupByLibrary.simpleMessage("Lưu"),
        "savePassError": MessageLookupByLibrary.simpleMessage(
            "Một số trường đang bị bỏ trống"),
        "savePassHint": MessageLookupByLibrary.simpleMessage("Nhập mật khẩu"),
        "savePassHintAccName":
            MessageLookupByLibrary.simpleMessage("Tài khoản (abc@gmail.com)"),
        "savePassHintConfirm":
            MessageLookupByLibrary.simpleMessage("Xác nhận mật khẩu"),
        "savePassHintName":
            MessageLookupByLibrary.simpleMessage("Tên (Tài khoản Netflix)"),
        "savePassHintPasswordName":
            MessageLookupByLibrary.simpleMessage("Mật khẩu (123456)"),
        "savePassSubTitle": MessageLookupByLibrary.simpleMessage(
            "Mật khẩu của bạn chỉ được lưu trong máy, bạn có thể kiểm tra hoạt động Internet của máy để xác nhận"),
        "savePassTitle":
            MessageLookupByLibrary.simpleMessage("Lưu tài khoản và mật khẩu"),
        "sbAccountDeleted":
            MessageLookupByLibrary.simpleMessage("Tài khoản đã bị xoá"),
        "sbAnswerWrong":
            MessageLookupByLibrary.simpleMessage("Câu trả lời không đúng"),
        "sbDeleteError":
            MessageLookupByLibrary.simpleMessage("Đã có lỗi xảy ra"),
        "sbDeletePassword": m2,
        "sbDeleteSuccess":
            MessageLookupByLibrary.simpleMessage("Xoá thành công"),
        "sbEditSuccess": MessageLookupByLibrary.simpleMessage(
            "Thay đổi mật khẩu thành công"),
        "sbEye": MessageLookupByLibrary.simpleMessage(
            "Bấm hình mắt để hiển thị mới có thể sao chép"),
        "sbLoginError": MessageLookupByLibrary.simpleMessage(
            "Tên hoặc mật khẩu không đúng"),
        "sbLoginErrorAttempt": m3,
        "sbSaveSuccess":
            MessageLookupByLibrary.simpleMessage("Lưu mật khẩu thành công"),
        "sbUpdateAccPassSuccess":
            MessageLookupByLibrary.simpleMessage("Mật khẩu đã được cập nhật"),
        "sbUpdateSuccess": MessageLookupByLibrary.simpleMessage(
            "Thay đổi mật khẩu thành công"),
        "search": MessageLookupByLibrary.simpleMessage("Tìm kiếm"),
        "secuQuesDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Nếu không trả lời, một số tính năng có thể bị khoá"),
        "secuQuesError": MessageLookupByLibrary.simpleMessage(
            "Câu trả lời không được để trống"),
        "secuQuesHint": MessageLookupByLibrary.simpleMessage("Trả lời"),
        "secuQuesTitle": MessageLookupByLibrary.simpleMessage(
            "(Không bắt buộc) Trả lời câu hỏi bảo mật phòng khi bạn mất mật khẩu."),
        "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
        "settingsAlwaysAuthen": MessageLookupByLibrary.simpleMessage(
            "Luôn yêu cầu nhập mã để xem mật khẩu"),
        "settingsAlwaysShow": MessageLookupByLibrary.simpleMessage(
            "Luôn hiển thị tên và mật khẩu"),
        "skip": MessageLookupByLibrary.simpleMessage("Bỏ qua"),
        "textContinue": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
        "welcomeBack":
            MessageLookupByLibrary.simpleMessage("Chào mừng trở lại"),
        "welcomeTo": MessageLookupByLibrary.simpleMessage("Chào mừng đến với")
      };
}
