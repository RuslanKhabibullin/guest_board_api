# Messages API

## Create with invalid params

### PATCH api/v1/messages/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id | Message id | true |  |
| content | Message content | true | message |

### Request

#### Headers

<pre>Accept: application/json
Origin: localhost
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjMzODgsImlhdCI6MTU4MzkzNTc2MywiaXNzIjoiaHR0cDovL3d3dy5leGFtcGxlLmNvbSJ9.Z2DBrJW3myRLfjgMhblKsTkMC8LgwSnjuUgcHcOXblE
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>PATCH api/v1/messages/1143</pre>

#### Body

<pre>message[content]=Bye%21</pre>

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
Content-Length: 169</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "entity": {
    "id": 1143,
    "content": "Bye!",
    "created_at": "2020-03-11 14:09:23 UTC",
    "user": {
      "id": 3388,
      "email": "current_user@email.com",
      "first_name": "Test",
      "last_name": "User"
    }
  }
}</pre>
