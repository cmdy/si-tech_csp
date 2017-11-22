### 本地构建
  + 准备基础镜
    > docker pull cmdy/alpine-oracle-jdk:8u152
  + 克隆当前工程
    > git clone https://github.com/cmdy/si-tech_csp.git
  + 构建
    > cd si-tech_csp/make/springcloud/api-gateway
    
    > docker build -t si-tech/spring-cloud-apigateway .
    
### 运行
  使用 docker run 启动，或者使用kubernetes 部署
### 自定义配置
  修改文件 application-production.yml 中内容，并挂载到容器中使用自定义命令启动
  > java  -jar  api-gateway-1.0.0-SNAPSHOT.jar  --spring.profiles.active=production
