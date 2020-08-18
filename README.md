# github位置
https://github.com/ccy1219/docker-img-base

# docker-img-base
## ubuntu 18.04 update
```bash
docker pull ccy1219/docker-img-base:ubuntu-1804-u
```
## ubuntu 18.04 + 基本工具
```bash
docker pull ccy1219/docker-img-base:ubuntu-1804-tools
```
## ubuntu 18.04 + 基本工具 + docker.io
```bash
docker pull ccy1219/docker-img-base:ubuntu-1804-docker.io
```
## python 3.7 + SSH登入
```bash
docker pull ccy1219/docker-img-base:python-37-ssh
# 1) 可使用密碼 'root' 登入
docker run -d --name demo_ssh ccy1219/docker-img-base:python-37-ssh
# 2) 可使用 key file 登入
docker run -d --name sshkey -v ~/your_keys/.ssh/:/root/.ssh:ro ccy1219/docker-img-base:python-37-ssh
# 資料夾 ~/your_keys/.ssh 須包含三個檔案 authorized_keys, id_rsa, id_rsa.pub
# 產生方式:
# ssh-keygen -q -t rsa -N '' -f ~/your_keys/.ssh/id_rsa
# cat ~/your_keys/.ssh/id_rsa.pub >> ~/your_keys/.ssh/authorized_keys
```
