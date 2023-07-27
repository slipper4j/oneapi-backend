# API 开放平台

该平台包含以下模块：

1. 后台管理系统
2. 客户端 SDK
3. 公共类库
4. API 网关模块
5. 后台接口库

## 客户端 SDK

客户端 SDK 提供给开发者使用，其中封装了 API 签名认证算法以简化开发者调用 API 的流程。

### 设计思想

客户端的整体流程：开发者创建请求对象，使用客户端发起 HTTP 请求至后端网关。

为了提高代码的**可复用性**与**可扩展性**，客户端采用面向抽象的设计模式，将客户端请求的各个环节进行抽象，形成了以下几个封装类：

1. `AbstractModel`：模型类，封装了请求参数的基本信息，通过 Gson 注解在请求的后处理中将**请求/响应参数转换为 JSON 格式**
   。实现类包含如下两种：
    - `Request`：请求对象，封装了请求的基本信息。
    - `Response`：响应对象，封装了响应的基本信息。
2. `HttpProfile`：HTTP 配置类，封装了 HTTP 请求的基本信息，如请求方法、请求地址、请求协议、请求超时时间等。
3. `ClientProfile`：客户端配置类，封装了 HttpProfile、签名方法等。
4. `AbstractClient`：客户端抽象类，封装了 ClientProfile、密钥对象、HTTP 请求方法。实现类：
    - `OneApiClient`：OneAPI 客户端实现类，封装自定义接口的请求方法。

注：在后台管理系统中，前端页面需为用户提供**在线调用**功能。为了在后端实现对 API 的动态调用，使用了**反射**
动态创建请求对象以在后端使用 SDK。