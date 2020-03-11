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
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIwMzcsImlhdCI6MTU4MzkzMjg5MiwiaXNzIjoiaHR0cDovL3d3dy5leGFtcGxlLmNvbSJ9.aMBYEBS8PLoRL73nEebIAOmYdCA0WmfbEXkTGBQmMLg
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE api/v1/messages/890</pre>

### Response

#### Headers

<pre>Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD
Access-Control-Expose-Headers: 
Access-Control-Max-Age: 7200
Vary: Origin</pre>

#### Status

<pre>204 No Content</pre>

