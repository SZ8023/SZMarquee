### SZMarquee

类似淘宝头条的走马灯效果！

![显示图片](https://github.com/SZ8023/SZMarquee/blob/master/screenshot/marquee.gif)

---

### 文字模式

使用方式特别的简单，你只需传入数据源，然后调用`start`方法即可开启定时器。

```objc
SZMarqueeView *nView = [[SZMarqueeView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 50)];
[self.view addSubview:nView];
self.nView = nView;
self.nView.noticeArr = [self.dataSource mutableCopy];
self.nView.noticeClick = ^(NSIndexPath *indexPath){
    NSLog(@"你点击了 %@",indexPath);
};
[self.nView start];
```

### 补充

只是简单的实现了功能，体验效果不是很好，有待进一步改进！