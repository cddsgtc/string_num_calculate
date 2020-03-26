## string_num_calculate

一个用于计算数字字符串算式的库。

可方便用于app制作虚拟键盘，虚拟计算器。

## 构成
    
    Calculate
    //主类
      - static Map<String, Function> funs
      定义的方法映射

      - static List<String> toNumberList
      把字符串中的数字和算式符号提取为list
      
      - static List<String> formatList
      把数字和算式符号列表中重复的符号去除

      - static num LinierCalculate
      直接计算字符串式算式

      - static num ListCalculate
      计算list式算式

      - static num plus
      加法

      - static num substract
      减法

      - static num multiply
      乘法
      
      - static num divide
      除法

      - static num percent
      消费或者百分式算法

## 安装

在pubspec.ymal文件中加入，然后运行`pub get packages`命令。

```yaml
dependencies:
  string_num_calculate: ^0.0.1
```

## 用法说明

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