# Signal Theory in Information Security and Cyber Attacks
In this project, firstly, the mathematical model of computer virus propagation is studied, and the characteristics of virus propagation are analyzed through the simulation curve. Then, a basic framework for modulating computer virus code converted into a binary data stream into the transmitted signal of an echo-free radar is simulated, aiming to study signal processing techniques related to cyberattacks and defense, as well as the feasibility of radiation injection.

本项目首先研究了计算机病毒传播的数学模型，并通过仿真曲线图分析了病毒传播的特性。随后，模拟了将被转换为二进制数据流的计算机病毒代码调制到无回波雷达的发射信号中的简单框架，旨在研究用于网络攻防领域的相关信号处理技术，并学习研究此类辐射注入的可行性。

In this case, **Frequency Shift Keying** (FSK) is used. In addition, phase shift keying (PSK), amplitude modulation (AM), phase modulation (PM), and quadrature amplitude modulation (QAM) can also be selected according to the actual situation.

在本例中，使用了**键控频移**调制的方式。除此之外，还可根据实际情况选择相移键控、调幅、调相和正交调幅等方式。

## Code details...
### Propagation mathematical model
[`sim_propagation.m`](https://github.com/Rc-W024/CyberAttk_SP/blob/main/sim_propagation.m): Computer virus propagation simulation for printing the propagation curve.

计算机病毒传播仿真以绘制计算机网络中病毒的传播曲线图。

Mathematical expectation 数学期望: $E\left (X_{n}\right )=\frac{N}{1+\left (\frac{N}{X_{0}}-1\right )e^{-n\frac{M}{N}}}=\frac{N}{1+\left (N-1\right )e^{-n\frac{M}{N}}}$

<img src="https://github.com/Rc-W024/CyberAttk_SP/assets/97808991/4ce2d3cc-d5ac-4cb7-b007-00a3a2114a28" width=500px/>

### Signal modulation
This script ([`virus_sig.m`](https://github.com/Rc-W024/CyberAttk_SP/blob/main/virus_sig.m)) is a simple simulation program for modulating computer virus signal. It is mainly divided into the following four parts:

该脚本是一个简单的仿真计算机病毒信号调制的程序。主要分为三部分：病毒代码模拟数据流生成、载波信号生成和信号调制。

This code is a simulation of a computer virus attack and it involves signal modulation techniques.

**Step 1:** Generate a random code data stream to simulate the computer virus.
<br>生成一个随机的代码数据流来模拟计算机病毒。

**Step 2:** Carrier signal generation. A carrier signal with `fc` using the cosine function.
<br>生成载波信号，并生成一个频率为`fc`的载波（余弦）信号。

**Step 3:** FSK modulation. For each binary data bit, if its value is $0$, set the frequency of the carrier signal to $f_{c}-bitRate/2$; if the value is $1$, set the frequency to $f_{c}+bitRate/2$, to generate the modulated signal. Finally, the modulation signal is added to the carrier signal to generate the signal to be emitted.
<br>FSK调制。对于每个二进制数据位，如果它的值为 $0$ ，则将载波信号的频率设置为 $f_{c}-bitRate/2$ ；如果值为 $1$ ，则将载波信号的频率设置为 $f_{c}+bitRate/2$ ，从而生成调制信号。最后，将调制信号与载波信号相加，生成待发射信号。

