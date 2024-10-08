# go模拟器

mac系统的参数 临时修改
``` shell
# 增大统默认的最大连接数限制
sudo sysctl -w kern.maxfiles=8880000
# 增大单个进程默认最大连接数限制
sudo sysctl -w kern.maxfilesperproc=8990000
# 设置当前shell能打开的最大文件数
ulimit -n 655350
# 设置当前shell可以创建的最大用户线程数
ulimit -u 26600
# 调整可用端口数量
sysctl -w net.inet.ip.portrange.first=5000

```

---
## 1. 连接数测试
-模拟器请求为1次注册 1次鉴权 循环发送心跳(10秒间隔)
-目前mac笔记本无线情况只能模拟2个IP 只能测试到10w+

## 2. 模拟实际场景测试
模拟器请求为1次注册 1次鉴权 循环发送心跳、位置上报、位置批量上报  <br/>
默认间隔时间分别为20秒 5秒 60秒  <br>
消息队列使用nats 发送位置上报和位置批量上报的报文  <br/>
统计发送和接收的数量情况 观察数据丢失情况