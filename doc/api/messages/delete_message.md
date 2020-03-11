# Messages API

## Delete message

### DELETE api/v1/messages/:id

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| id | Message id | true |  |

### Request

#### Headers

<pre>Accept: application/json
Origin: localhost
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEzNjksImlhdCI6MTU4MzkyNDAyNiwiaXNzIjoiaHR0cDovL3d3dy5leGFtcGxlLmNvbSJ9.PPWP9GT0KLWhVH1wWRpk39jh9d6hGOqExt1XSr3Uc_g
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE api/v1/messages/607</pre>

### Response

#### Headers

<pre>Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD
Access-Control-Expose-Headers: 
Access-Control-Max-Age: 7200
Vary: Origin</pre>

#### Status

<pre>204 No Content</pre>

