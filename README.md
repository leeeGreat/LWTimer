# LWTimer
使用NSTimer注意点，一，防止循环引用；二，timer不要直接引用self或者weakSelf，如引用会导致返回上级vc时， 当前vc无法释放
