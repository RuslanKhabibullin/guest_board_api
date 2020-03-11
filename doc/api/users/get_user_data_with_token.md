# Users API

## Get user data with token

### GET api/v1/users/me
### Request

#### Headers

<pre>Accept: application/json
Origin: localhost
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIwNTMsImlhdCI6MTU4MzkzMjg5MywiaXNzIjoiaHR0cDovL3d3dy5leGFtcGxlLmNvbSJ9.PEwl9nTpbZ46uvmUrkv0AJewLKNBIEVGSFvSd_hfb9A
Host: example.org
Cookie: </pre>

#### Route

<pre>GET api/v1/users/me</pre>

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
Content-Length: 55</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "entity": {
    "id": 2053,
    "email": "current_user@email.com"
  }
}</pre>
