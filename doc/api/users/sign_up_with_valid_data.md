# Users API

## Sign up with valid data

### POST api/v1/sign_up

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| email | User email | true | user |
| password | User password | true | user |
| first_name | User first name | true | user |
| last_name | User last name | true | user |

### Request

#### Headers

<pre>Accept: application/json
Origin: localhost
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST api/v1/sign_up</pre>

#### Body

<pre>user[email]=user%40email.com&user[password]=12345678&user[first_name]=User&user[last_name]=Test</pre>

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
Content-Length: 157</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "token": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjMzOTcsImlhdCI6MTU4MzkzNTc2MywiaXNzIjoiaHR0cDovL3d3dy5leGFtcGxlLmNvbSJ9.-PbWoKcgpK3gMys5ybF0unoNlJiowDWi6-PDMknBm_g"
}</pre>
