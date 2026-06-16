#import "../../../../config.typ": template, tufted

#let zh-template = template.with(
  lang: "zh",
  header-links: (
    "/zh/": "首页",
    "/zh/Blog/": "文章",
    "/zh/Docs/": "文档",
    "/CV/": "简历",
  ),
  website-title: "一个普通的黄桃的博客",
  description: "记录 AI Infra、Data curation、Math、RL、OPD、Agent和可复用工程速查笔记。",
)

#show: zh-template.with(
  title: "Python 中的迭代器与生成器",
  description: "理解 Python 中迭代器与生成器的区别，以及何时使用它们。",
  date: datetime(year: 2024, month: 10, day: 4),
  lang: "zh",
)

= Python 中的迭代器与生成器

Python 的迭代协议是编写高效、地道代码的基础。#footnote[迭代器协议于 Python 2.2（2001年）随 PEP 234 引入。]迭代器与生成器密切相关，但理解它们的差异有助于你为不同场景选择正确的工具。

== 什么是迭代器？

迭代器是实现迭代器协议的任意对象：即具备 `__iter__()` 和 `__next__()` 两个方法。#footnote[可迭代对象（iterable）在调用 `__iter__()` 时返回一个迭代器，而迭代器（iterator）在 `__iter__()` 中返回自身，并通过 `__next__()` 产生值。]当你遍历列表或元组时，Python 会在幕后创建一个迭代器。你也可以通过在类中定义这两个方法来构建自定义迭代器。

```python
class Counter:
    def __init__(self, max):
        self.max = max
        self.current = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.current >= self.max:
            raise StopIteration
        self.current += 1
        return self.current
```

== 生成器登场

生成器是一种更简洁的创建迭代器的方式，它使用函数和 `yield` 关键字。#footnote[Python 也支持生成器表达式，如 `(x*2 for x in range(10))`，与列表推导式类似，但创建的是生成器而非列表。]你无需在类属性中维护状态，生成器会自动在调用之间保存状态。这让它们更简洁，通常也更易读。

```python
def counter(max):
    current = 0
    while current < max:
        current += 1
        yield current
```

生成器函数与我们的迭代器类产生相同的结果，但样板代码少得多。#footnote[生成器在局部变量和执行位置上保存自身状态，本质上是一种可恢复的函数。]当你调用生成器函数时，它会返回一个自动生成迭代器协议的生成器对象。

== 内存效率

迭代器和生成器都是惰性的——它们按需生成值，而非将所有值存入内存。这使它们非常适合处理大型数据集或无限序列。#footnote[`itertools` 模块提供了强大的函数，如 `count()` 和 `cycle()`，可创建无限迭代器。]一个生成十亿个数字的生成器只消耗极少的内存，而包含十亿个数字的列表则会耗尽大多数系统的资源。

#figure(image("../../../../content/Blog/2024-10-04-iterators-generators/imgs/python.webp"), caption: [四个人举着一条长蟒蛇])

== 何时使用哪一个？

大多数场景使用生成器——它们更简单、更易读。当你需要复杂的状态管理、多个迭代器方法，或构建需要更复杂行为的可复用组件时，再选择自定义迭代器类。

理解这些工具能为你解锁更优雅的常见编程问题解决方案。
