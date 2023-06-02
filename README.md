# Signal Theory in Information Security and Cyber Attacks
This project simulates a basic framework for modulating computer virus code converted into a binary data stream into the transmitted signal of an echo-free radar, aiming to study signal processing techniques related to cyberattacks and defense, as well as the feasibility of radiation injection.

本项目模拟了将被转换为二进制数据流的计算机病毒代码调制到无回波雷达的发射信号中的简单框架，旨在研究用于网络攻防领域的相关信号处理技术，并学习研究此类辐射注入的可行性。

In this case, frequency modulation (FM) is used. In addition, amplitude modulation (AM) and phase modulation (PM) can also be selected according to the actual situation. FM technology is usually used in high-fidelity music and voice radio broadcasts on the very high frequency band (VHF radio band), and is a widely used modulation method for transmitting information.

在本例中，使用了频率调制（调频）的方式。除此之外，还可根据实际情况选择调幅和调相。调频技术通常运用在甚高频段（VHF无线电波段）上的高保真音乐和语音的无线电广播，是广泛用于传递信息的调制方式。

## Code details...
This script ([`virus_sig.m`](https://github.com/Rc-W024/CyberAttk_SP/blob/main/virus_sig.m)) is a simple simulation program for modulating computer virus signal. It is mainly divided into the following four parts:

该脚本是一个模拟计算机病毒信号调制的程序。主要分为四个部分：病毒代码模拟数据流生成、调制信号生成、频率调制和绘图。

**1. Generation of computer code data stream**

A random binary code data stream `code_data` is generated using the *randi* function. The length is determined by the variable `num_bits`, which represents the number of binary bits.

使用*randi*函数生成随机二进制代码数据流`code_data`，其长度由变量`num_bits`确定，代表二进制位数。

**2. Generation of modulation signal**

Define modulation parameters, including the center frequency `f0`, the sampling rate (symbol rate) `fs`, and the modulation index `modIndex`. Then, loop through each element in the code data stream, if the value of the element is 1, set the modulation signal to 1 in the corresponding time period, otherwise keep it as 0. Finally, the modulated signal `mod_sig` is obtained.

定义信号的调制参数，包括雷法发射机中心频率`f0`、采样率（符号率）`fs`和信号调制指数`modIndex`。随后，遍历代码数据流中的每个元素，如果该元素的值为1，则在相应的时间段内将调制信号设置为1，否则为0。最后，即可得到调制信号`mod_sig`。

**3. Frequency modulation**

Frequency modulation of both the modulating signal and the carrier signal. The frequency change is achieved by multiplying `modIndex` and `mod_sig`, and the frequency in the time period corresponding to each 1 of the modulated signal is offset relative to the center frequency `f0` to generate the final modulated signal `modulatedSig`.

将调制信号与载波信号进行频率调制。通过`modIndex`和`mod_sig`相乘来实现频率的变化，将调制信号的每个1对应的时间段内的频率相对于中心频率`f0`进行偏移，生成最终的调制信号`modulatedSig`。

**4. Print figures**

The first subplot shows the binary representation of data stream in computer code. The second subplot displays the modulation signal `mod_sig` over time, that is, when the code data bit is 1, the signal is high; otherwise, it is low. The third subplot shows the frequency-modulated signal `modulatedSig` changing over time. It can be observed that the signal frequency changes when each code data bit is 1 during the given time period.

第一个子图表示计算机代码数据流的二进制表示；第二个子图表示调制信号`mod_sig`随时间的变化，即在代码数据位为1时，信号为高电平，否则为低电平；第三个子图表示经过频率调制后的调制信号`modulatedSig`随时间的变化，可见信号的频率在每个代码数据位为1的时间段内发生了偏移。
