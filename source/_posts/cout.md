---
title: cout
date: 2018-05-15 15:57:58
tags:
---
### cout

大家都知道游戏吧？但是大家想不想编写一个游戏呢？别着急，一口吃不了一个胖子，我们先从编程语言来说。

编程有很多的语言，例如：pascal、c、c++、Java、php等等。但是，目前noip只支持pascal、c、c++，（pascal即将被禁赛，可以字形百度一下^_^),而c++中涵盖了所有c的内容，所以，我决定教大家c++。

首先，许多人接触程序，都会编一个程序（你好世界）那么大家学习如何写程序吧。

```
#include<iostream>
int main()
{
	std::cout<<"Hello world!";
	return 0;
}
```
大家看到这段代码先不要着急，我们来看一看这段代码的含义：
1、 首先，代码第一行“#include<iostream>” 第一行调用iostream库，这里面有cout的内容;
2、 第二行是一个主函数main，在这里面开始写代码的内容;
3、 第三行则是输出了，std::是standard的意思，调用很多库的代码时很多都要写这std::。后面就是本次讲的主题了：cout。使用cout时，输出时要添加<<

用个形象一点的说法吧
cout是输出也就是大家所看到的舞台，使用符号<<将右边的东西拉过来，就是把我们所说的东西拉过来，这里我们就把hello world！拉过来了

继续讲：
这一段就是输出，输出内容要加双引号。

第四行，则结束程序，return 0；是大家公认的结束。

大家把上段代码放进编译器里尝试一下吧。


好，咱们继续运行代码,
```
#include<iostream>
int main()
{
	std::cout<<" * ";
	std::cout<<endl;
	std::cout<<"***";
	std::cout<<endl;
	return 0;
}
```
想必大家注意到一个问题了，就是每次都要写std::，也许这一段程序大家可能还不觉得烦，但是如果一个程序几百行，几千行，甚至几万行了。这样我光打std::，手都会酸？

那么怎么避免这个问题的产生？那就是我没在main函数之前加一条"using namespace std;"
下面就是这个程序的代码：
```
#include<iostream>
using namespace std;
int main()
{
	cout<<" * "<<endl;
	cout<<"***"<<endl;
	return 0;
}

这就是这道题的代码，大家还可以做一些练习题，在loj.ac 的第二题“hello world！”大家可以试一下
