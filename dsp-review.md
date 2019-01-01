<h1 align="center">数字信号处理复习</h1>

# $\Re$ 目录

[TOC]

# $\wp$ 填空(10)

## 1.信号分类

- 连续时间信号

- 离散时间信号

- 模拟信号

- 数字信号

- 偶信号

  - $x(-t)=x(t),\forall\  t$

- 奇信号

  - $x(-t)=-x(t),\forall\  t$

- 周期信号

  - $x(t)=x(t+T)\quad\forall\ t$

- 非周期信号

- 确定信号

- 随机信号

- 实信号

  - $x(t)=\sum\limits_{i}A_ie^{s_it}$

- 复信号

- 能量信号
  $$
  E=\int\limits_{-\infty}^{\infty}|x(t)|^2dt
  $$

- 功率信号


$$
平均功率 \int\limits_{i}^{\infty}xdx=P=\lim\limits_{t_0\to\infty}\cfrac{1}{t_0}\int\limits_{-\frac{t_0}{2}}^{\frac{t_0}{2}}|x(t)|^2dt
$$


## 2.

# $\Re$ 选择(40)

# $\mho$ 简答(30)

# $\aleph$ 计算(20)



- [x] completed
- [ ] incomplete



<i@typora.io>

:smile:

```mermaid
graph LR;
a-->|test|b;
a-- test -->c;
b-.->d;
c==>d;

subgraph one
a1-->b2
end
subgraph two
b1-->a2
end


id1((he));
id2>test];
id3(test);
id4{test};
A --- B;

B["fa:fa-twitter for peace"]
    B-->C[fa:fa-ban forbidden]
    B-->D(fa:fa-spinner);
    B-->E(A fa:fa-camera-retro perhaps?);
```



```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->John: Hello John, how are you?
    loop Healthcheck
        John->John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail...
    John-->Alice: Great!
    John->Bob: How about you?
    Bob-->John: Jolly good!
```





```mermaid
gantt
        dateFormat  YYYY-MM-DD
        title Adding GANTT diagram functionality to mermaid
        section A section
        Completed task            :done,    des1, 2014-01-06,2014-01-08
        Active task               :active,  des2, 2014-01-09, 3d
        Future task               :         des3, after des2, 5d
        Future task2               :         des4, after des3, 5d
        section Critical tasks
        Completed task in the critical line :crit, done, 2014-01-06,24h
        Implement parser and jison          :crit, done, after des1, 2d
        Create tests for parser             :crit, active, 3d
        Future task in critical line        :crit, 5d
        Create tests for renderer           :2d
        Add to mermaid                      :1d
```



```mermaid
gantt
       dateFormat  YYYY-MM-DD
       title Adding GANTT diagram functionality to mermaid

       section A section
       Completed task            :done,    des1, 2014-01-06,2014-01-08
       Active task               :active,  des2, 2014-01-09, 3d
       Future task               :         des3, after des2, 5d
       Future task2              :         des4, after des3, 5d

       section Critical tasks
       Completed task in the critical line :crit, done, 2014-01-06,24h
       Implement parser and jison          :crit, done, after des1, 2d
       Create tests for parser             :crit, active, 3d
       Future task in critical line        :crit, 5d
       Create tests for renderer           :2d
       Add to mermaid                      :1d

       section Documentation
       Describe gantt syntax               :active, a1, after des1, 3d
       Add gantt diagram to demo page      :after a1  , 20h
       Add another diagram to demo page    :doc1, after a1  , 48h

       section Last section
       Describe gantt syntax               :after doc1, 3d
       Add gantt diagram to demo page      :20h
       Add another diagram to demo page    :48h
```





```mermaid
gantt
dateFormat  YYYY-MM-DD
title Shop项目交付计划

section 里程碑1 
数据库设计          :active,    p1, 2018-012-15, 3d
详细设计            :           p2, after p1, 2d

section 里程碑2
后端开发            :           p3, 2018-12-22, 20d
前端开发            :           p4, 2018-12-22, 15d

section 里程碑3
功能测试            :       p6, after p3, 5d
上线               :       p7, after p6, 2d
交付               :       p8, afterp7, 2d
```



```mermaid
graph TB
系统-->输入输出信号;
输入输出信号-->连续时间系统;
连续时间系统-.-微分方程;
输入输出信号-->离散时间系统;
离散时间系统-.-差分方程;
系统-->|齐次性 & 叠加性|线性系统;
线性系统-.-非线性性系统;
系统-->时间;
时间-->|有关|时变系统;
时间-->|无关|时不变系统;
```

