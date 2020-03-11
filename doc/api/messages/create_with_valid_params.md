# Messages API

## Create with valid params

### POST api/v1/messages

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| content | Message content | true | message |

### Request

#### Headers

<pre>Accept: application/json
Origin: localhost
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEzNjgsImlhdCI6MTU4MzkyNDAyNiwiaXNzIjoiaHR0cDovL3d3dy5leGFtcGxlLmNvbSJ9.woQrEmT70EuFRCt5IsV6qKhjFcuVhqfkd3ubKgvc7gY
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST api/v1/messages</pre>

#### Body

<pre>message[content]=Say+hello+to+my+little+friend%21</pre>

### Response

#### Headers

<pre>Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD
Access-Control-Expose-Headers: 
Access-Control-Max-Age: 7200
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
X-XSS-Protection: 1; mode=block
Content-Security-Policy: form-action &#39;self&#39;; frame-ancestors &#39;self&#39;; base-uri &#39;self&#39;; default-src &#39;none&#39;; script-src &#39;self&#39;; connect-src &#39;self&#39;; img-src &#39;self&#39; https: data:; style-src &#39;self&#39; &#39;unsafe-inline&#39; https:; font-src &#39;self&#39;; object-src &#39;none&#39;; plugin-types application/pdf; child-src &#39;self&#39;; frame-src &#39;self&#39;; media-src &#39;self&#39;
Content-Type: application/json; charset=utf-8
Vary: Origin
Content-Length: 155</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "entity": {
    "id": 606,
    "content": "Say hello to my little friend!",
    "created_at": "2020-03-11 10:53:46 UTC",
    "user": {
      "id": 1368,
      "email": "current_user@email.com"
    }
  }
}</pre>
