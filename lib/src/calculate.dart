// 编写中注意一些顺序和便利的陷阱

// 用来解析一串字符串中的数字式
/// 主类，主要作用是空间命名
class Calculate {
  /// 静态符号和计算方法名的map映射
  static final Map<String, Function> funs = {
    '+': plus,
    '-': substract,
    '×': multiply,
    '÷': divide,
    '%': percent,
    '/': divide,
    '*': multiply
  };

  // 求出一段文字中的数字
  /// toNumberList从一端字符串中解析出数字list
  /// onlyNumber bool false 是否也包括一些计算符号
  static List<String> toNumberList(String str, {bool onlyNumber = false}) {
    if (str.isEmpty) return [];
    RegExp reg1 = onlyNumber
        ? RegExp(r'(\d+(\.\d+)?|\.\d+)')
        : RegExp(r'((\d+(\.\d+)?|\.\d+)|[\*/+\-×÷%])');
    Iterable<Match> matchs = reg1.allMatches(str);
    return matchs.toList().map((ms) {
      return ms.group(0);
    }).toList();
  }

// 去除重复符号
  ///去除一个数字列表中数学计算符号有相重的问题。
  static List<String> formatList(List<String> list) {
    RegExp reg = RegExp(r'[\*/+\-×÷%]');
    RegExp reg2 = RegExp(r'[\*/×÷%]');

    for (var i = 1; i < list.length; i++) {
      String char1 = list[i], char2 = list[i - 1];
      if (reg.hasMatch(char1) && reg.hasMatch(char2)) {
        list.removeAt(i - 1);
      }
    }
    if (reg2.hasMatch(list.first)) list.removeAt(0);
    if (reg.hasMatch(list.last)) list.removeLast();
    // if(reg3.hasMatch(list.first) ) list.insert(0, '0');
    return list;
  }

// 一个符合计算规律的计算
/* 
* 摘取乘除法先计算然后再计算其他加减法
 */
  /// 计算一个数学计算字符串的值
  static num LinierCalculate(String str) {
    RegExp firstCalculateReg =
        RegExp(r'(\d+(\.\d+)?|\.\d+)([\*/×÷](\d+(\.\d+)?|\.\d+))+');
    // 先计算出乘除法
    firstCalculateReg.allMatches(str).toList().forEach((match) {
      str = str.replaceFirstMapped(match.group(0), (match) {
        List<String> numberList = formatList(toNumberList(match.group(0)));
        return ListCalculate(numberList).toString();
      });
    });
    List<String> list = toNumberList(str);
    // 最后是加减法
    return ListCalculate(list);
  }

/* 
* list计算
* 数字加符号的列表计算
* 如果两个数字之间没有符号则相加
 */
  /// 计算一个正常的数字计算列表
  static num ListCalculate(List<String> list) {
    if (list.length == 1) {
      return num.parse(list[0]);
    } else if (list.length == 0) {
      return 0;
    }
    RegExp reg3 = RegExp(r'[\+\-]');
    if (reg3.hasMatch(list.first)) list.insert(0, '0');
    num current = num.parse(list.first);
    RegExp numReg = RegExp(r'(\d+(\.\d+)?|\.\d+)');
    RegExp optReg = RegExp(r'[\*/+\-×÷%]');
    Function fun;
    for (num i = 1; i < list.length; i++) {
      String char = list[i];
      if (numReg.hasMatch(char)) {
        num charNum = num.parse(char);
        if (fun != null) {
          current = fun(current, charNum);
          fun = null;
        } else {
          current += charNum; // 如果两个数字之间没有符号则相加
        }
      } else if (optReg.hasMatch(char)) {
        fun = funs[char];
      }
    }
    return current;
  }

  /// 相加计算方法
  static num plus(num a, num b) {
    return a + b;
  }

  /// 相减计算方法
  static num substract(num a, num b) {
    return a - b;
  }

  /// 相乘计算方法
  static num multiply(num a, num b) {
    return a * b;
  }

  /// 相除计算方法
  static num divide(num a, num b) {
    return a / b;
  }

  /// 百分比,消费计算方法
  static num percent(num a, num b) {
    return a * b / 100;
  }
}
