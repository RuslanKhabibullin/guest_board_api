# Messages API

## Get message data with token

### GET api/v1/messages
### Request

#### Headers

<pre>Accept: application/json
Origin: localhost
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjMzODYsImlhdCI6MTU4MzkzNTc2MywiaXNzIjoiaHR0cDovL3d3dy5leGFtcGxlLmNvbSJ9.T1z0eVXu-olN90oYof2OVxgJlfTXr-lwRBPTEVyjfiU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET api/v1/messages</pre>

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
Content-Length: 175</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "entities": [
    {
      "id": 1141,
      "content": "Hello!",
      "created_at": "2020-03-11 14:09:23 UTC",
      "user": {
        "id": 3386,
        "email": "current_user@email.com",
        "first_name": "Test",
        "last_name": "User"
      }
    }
  ]
}</pre>
