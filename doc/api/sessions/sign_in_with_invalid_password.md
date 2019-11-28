# Sessions API

## Sign in with invalid password

### POST api/v1/sign_in

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| email | User email | true | user |
| password | User password | true | user |

### Request

#### Headers

<pre>Accept: application/json
Origin: localhost
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST api/v1/sign_in</pre>

#### Body

<pre>user[email]=user%40email.com&user[password]=12345670</pre>

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
Content-Length: 40</pre>

#### Status

<pre>401 Unauthorized</pre>

#### Body

<pre>{
  "error": {
    "base": [
      "unauthorized user"
    ]
  }
}</pre>
