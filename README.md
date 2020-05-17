## string_num_calculate

一个用于计算数字字符串算式的库。
Calculate mathematical formula result from string.

可方便用于app制作虚拟键盘，虚拟计算器。
With this package, You can easily make virtual keyboard or virtual calculator for your APP.

已通过测试，可放心使用。
All tests passed, enjoy :)

## API
    
Calculate
// Main Class
  - static Map<String, Function> funs
  定义的方法映射 

- static List<String> toNumberList

  把字符串中的数字和算式符号提取为list<br>
  Extract numbers and operators from the string into a list


      
- static List<String> formatList

  把数字和算式符号列表中重复的符号去除<br>
  Remove redundant operators from list<br>


- static num LinierCalculate

  直接计算字符串式算式<br>
  Calculate directly from string<br>

- static num ListCalculate

  计算list式算式<br>
  Calculate for list<br>

- static num plus

  加法<br>
  plus<br>

- static num substract

  减法<br>
  minus<br>

- static num multiply

  乘法<br>
  multiply<br>
      
- static num divide

  除法<br>
  divide<br>

- static num percent

  消费或者百分式算法<br>
  percentage<br>

## 安装 Installation

在pubspec.ymal文件中加入，然后运行`pub get packages`命令。
Add this line into `pubspec.ymal`, then run `pub get packages`

```yaml
dependencies:
  string_num_calculate: ^0.0.1
```

## 用法说明 Usage

```dart
import 'package:string_num_calculate/string_num_calculate.dart';// 引入

Calculate.plus(1, 2);//=>3
Calculate.substract(1, 2);//=>-1
Calculate.multiply(1, 2);//=>2
Calculate.divide(1, 2);//=>.5
Calculate.percent(1, 2);//=>0.02
Calculate.ListCalculate(['1', '-', '5']);//=>-4
Calculate.toNumberList('1-5');//=>['1','-','5']
Calculate.formatList(['1', '+', '-', '5']);//=>['1','-','5']
Calculate.LinierCalculate('1+3+5');//=>9
```

## 测试
```dart
// 加法计算 Plus
  test('static [plus]计算加', () {
    expect(Calculate.plus(1, 2), 3);
    expect(Calculate.plus(1, -2), -1);
    expect(Calculate.plus(-1, -2), -3);
    expect(Calculate.plus(-.1, -2), -2.1);
    expect(Calculate.plus(-.1, -0.2), -0.30000000000000004);
  });
  // 减法计算 Minus
  test('static [substract]计算减', () {
    expect(Calculate.substract(1, 2), -1);
    expect(Calculate.substract(.1, -2), 2.1);
    expect(Calculate.substract(0.1, -2), 2.1);
  });
  // 乘法计算 Multiply
  test('static [multiply]计算乘', () {
    expect(Calculate.multiply(1, 2), 2);
    expect(Calculate.multiply(1, -2), -2);
    expect(Calculate.multiply(1, 0), 0);
  });
  // 除法计算 Divide
  test('static [divide]计算除', () {
    expect(Calculate.divide(1, 2), .5);
    expect(Calculate.divide(1, -2), -.5);
  });
  // 小费计算 Tips
  test('static [percent]计算百分数', () {
    expect(Calculate.percent(1, 2), 0.02);
    expect(Calculate.percent(1, -2), -0.02);
    expect(Calculate.percent(100, 2), 2);
  });

  // 数字list计算 Calculate for list
  test('static [ListCalculate]数字list计算', () {
    expect(Calculate.ListCalculate(['1', '-', '5']), -4);
    expect(Calculate.ListCalculate(['1', '+', '5']), 6);
    expect(Calculate.ListCalculate(['-1', '×', '5']), -5);
    expect(Calculate.ListCalculate(['1', '%', '5']), 0.05);
  });
  // 数字字符串转换成数字list Convert from string to list
  test('static [toNumberList]数字字符串转list', () {
    expect(Calculate.toNumberList('1-5'), ['1', '-', '5']);
    expect(Calculate.toNumberList('-1+5'), ['-','1', '+', '5']);
    expect(Calculate.toNumberList('1×5'), ['1', '×', '5']);
    expect(Calculate.toNumberList('1%5'), ['1', '%', '5']);
  });
  // 数字list去除符号相同 Remove redundant operators from list
  test('static [formatList]数字字符串转list', () {
    expect(Calculate.formatList(['1', '+', '-', '5']), ['1', '-', '5']);
    expect(Calculate.formatList(['1', '+', '+', '5']), ['1', '+', '5']);
    expect(Calculate.formatList(['1', '+', '×', '5']), ['1', '×', '5']);
    expect(Calculate.formatList(['1', '+', '%', '5']), ['1', '%', '5']);
  });
  // 字符串计算 Calculate from string
  test('Calculate->[LinierCalculate]计算一个字符串计算', () {
    expect(Calculate.LinierCalculate('1+.3+5'), 6.3);
    expect(Calculate.LinierCalculate('-1+0.3+5'), 4.3);
    expect(Calculate.LinierCalculate('-1*3+5'), 2);
    expect(Calculate.LinierCalculate('-1/2+5'), 4.5);
  });
```
