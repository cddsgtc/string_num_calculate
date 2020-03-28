import 'package:test/test.dart';
import 'package:string_num_calculate/string_num_calculate.dart';

void main() {
  // 加法计算
  test('static [plus]计算加', () {
    expect(Calculate.plus(1, 2), 3);
    expect(Calculate.plus(1, -2), -1);
    expect(Calculate.plus(-1, -2), -3);
    expect(Calculate.plus(-.1, -2), -2.1);
    expect(Calculate.plus(-.1, -0.2), -0.30000000000000004);
  });
  // 减法计算
  test('static [substract]计算减', () {
    expect(Calculate.substract(1, 2), -1);
    expect(Calculate.substract(.1, -2), 2.1);
    expect(Calculate.substract(0.1, -2), 2.1);
  });
  // 乘法计算
  test('static [multiply]计算乘', () {
    expect(Calculate.multiply(1, 2), 2);
    expect(Calculate.multiply(1, -2), -2);
    expect(Calculate.multiply(1, 0), 0);
  });
  // 除法计算
  test('static [divide]计算除', () {
    expect(Calculate.divide(1, 2), .5);
    expect(Calculate.divide(1, -2), -.5);
  });
  // 小费计算
  test('static [percent]计算百分数', () {
    expect(Calculate.percent(1, 2), 0.02);
    expect(Calculate.percent(1, -2), -0.02);
    expect(Calculate.percent(100, 2), 2);
  });

  // 数字list计算
  test('static [ListCalculate]数字list计算', () {
    expect(Calculate.ListCalculate(['1', '-', '5']), -4);
    expect(Calculate.ListCalculate(['1', '+', '5']), 6);
    expect(Calculate.ListCalculate(['-1', '×', '5']), -5);
    expect(Calculate.ListCalculate(['1', '%', '5']), 0.05);
  });
  // 数字字符串转换成数字list
  test('static [toNumberList]数字字符串转list', () {
    expect(Calculate.toNumberList('1-5'), ['1', '-', '5']);
    expect(Calculate.toNumberList('-1+5'), ['-','1', '+', '5']);
    expect(Calculate.toNumberList('1×5'), ['1', '×', '5']);
    expect(Calculate.toNumberList('1%5'), ['1', '%', '5']);
  });
  // 数字list去除符号相同
  test('static [formatList]数字字符串转list', () {
    expect(Calculate.formatList(['1', '+', '-', '5']), ['1', '-', '5']);
    expect(Calculate.formatList(['1', '+', '+', '5']), ['1', '+', '5']);
    expect(Calculate.formatList(['1', '+', '×', '5']), ['1', '×', '5']);
    expect(Calculate.formatList(['1', '+', '%', '5']), ['1', '%', '5']);
  });
  // 字符串计算
  test('Calculate->[LinierCalculate]计算一个字符串计算', () {
    expect(Calculate.LinierCalculate('1+.3+5'), 6.3);
    expect(Calculate.LinierCalculate('-1+0.3+5'), 4.3);
    expect(Calculate.LinierCalculate('-1*3+5'), 2);
    expect(Calculate.LinierCalculate('-1/2+5'), 4.5);
  });
}
