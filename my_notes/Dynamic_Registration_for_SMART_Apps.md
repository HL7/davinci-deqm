[Previous Page](SMART-on-FHIR.html)

Member-authorized access to Payer FHIR APIs for other Payers and Third-Party Applications creates a situation where Payers **MAY** need to cross-register applications with many other payers. This multiplicity of cross-registrations creates a situation where one or more entities providing a verification service for a "Community of Trust" provides significant economies of scale that benefits both organizations registering applications and data holders (such as payers) needing to register those applications.

The FHIR community has recognized the need to solve the challenge of a more streamlined dynamic registration process. A specification has been developed: [Unified Data Access Profiles - Dynamic Client Registration](http://www.udap.org/udap-dynamic-client-registration.html). 

The UDAP Dynamic Client Registration specification **MAY** be followed by Payers wanting to streamline their application registration process. The specification is still in development and testing. It is included here, but may be superceded by developments to the specification as a result of continued testing and pilot implementations.

### UDAP Dynamic Client Registration 
Draft Version: 2018-07-14

Registration with an Authorization Server is typically required before a Client Application can access protected resources using the OAuth 2.0 authorization framework. For larger ecosystems with numerous clients and authorization servers, manual client registration requiring one-off enrollments or pairwise key exchange presents a significant barrier. Such communities can leverage a distributed system of authoritative information through the use of digital certificates to enable a scalable dynamic solution to client registration, allowing real-time trust assessment, validation of identifying attributes, and support for revocation.

UDAP implements dynamic client registration using digital certificates as an extension to the OAuth 2.0 dynamic client registration protocol defined in RFC 7591. Use of this extension is requested by Client Apps by including a digitally signed software statement in their requests to the registration endpoint, where the signature is backed by an X.509 certificate. This framework also allows Client Apps to submit digitally signed certifications and endorsements provided by third parties as part of their registration request, which can be independently validated by the Authorization Server prior to allowing the registration of a Client App.

This protocol is based upon standard Public Key Infrastructure tools. Before granting registration, the Authorization Server validates the digital signature on the software statement submitted by the Client App, and evaluates the trust chain for the Client Apps certificate. Client registration is permitted only if the software statement is valid and the Client Apps certificate is trusted. This protocol MAY be used only by Client Apps that are able to protect the private key used to sign software statements, e.g. confidential clients and certain native device apps.

Note: The HTTP request and response examples presented below are non-normative. For readability purposes, line wraps have been added to some HTTP headers and request bodies, some headers have been omitted, and some parameters have not been URL encoded.

The following steps define the workflow:

1. The Client App checks that the Authorization Server supports UDAP by retrieving the Authorization Servers UDAP metadata from a well-known URL.

<pre>
GET /.well-known/udap HTTP/1.1
Host: resourceholder.example.com
</pre>

Response:

<pre>
HTTP/1.1 200 OK
Content-Type: application/json

{ 
  "x5c" : ["{cert1}", "{cert2}", ]
}
</pre>

If the Authorization Server returns an error code, then the Authorization Server does not support UDAP Dynamic Client Registration and the Client App should abort this workflow.

2. The Client App prepares a software statement for submission. The software statement serves three purposes: it provides the necessary metadata for registration, it establishes the Client Apps control of a private key, and it provides the digital certificate needed to validate the signature and establish trust.

The software statement is a signed JWT containing the following claims:

   iss: Client App Operators unique identifying URI (identifying the holder of private key, also serves as the base URI for UDAP metadata including lookup of certificates)
   sub: same as iss 
   aud: base URL of Authorization Server
   exp: expire time (should be short-lived, max 5 minutes from iat)
   iat: issued at time
   jti: token identifier used to identify token replay
   client_name: string
   redirect_uris: array of URIs
   grant_types: authorization_code | client_credentials
   response_types: code (omit for client_credentials)
   token_endpoint_auth_method: private_key_jwt

The JOSE Header for the software statement contains the following key/value pairs:

   alg : "RS256"
   x5c : [cert1, cert2, ] (cert1 is required; remainder of chain is optional)
   x5u : valid URI (optional)

The x5c claim contains the Client Apps certificate chain as an array of one or more elements, each containing a base64 encoded representation of the DER encoded X.509 certificate. The leaf certificate (cert1) contains the public key corresponding to the private signing key used by the Client App to digitally sign the software statement. The software statement is signed and assembled using JWS compact serialization as per RFC 7515.

3. The client requests registration by submitting the signed software statement to the Authorization Servers registration endpoint. The additional extension parameter udap is also included with a string value of 1 to signal to the Authorization Server that version 1 of this protocol is being used, and that the included software statement conforms to this profile. Optionally, the Client App MAY submit certifications or endorsements provided by third parties by including the optional extension parameter certifications with a value of an array of one or more signed JWTs, each representing a separate certification or endorsement:

<pre>
POST /register HTTP/1.1
Host: as.example.com
Content-type: application/json

{
   "software_statement" : "{signed software statement}",
   "certifications" : [array of one or more signed JWTs],
   "udap" : "1"
}
</pre>

4. Authorization Server validates request

4.1 The Authorization Server validates the digital signature on the software statement using the public key extracted from cert1 in the x5c parameter of the JOSE header. If the signature cannot be validated, the request is denied.

4.2 The Authorization Server attempts to construct a valid certificate chain from the Clients certificate (cert1) to an anchor certificate trusted by the Authorization Server using conventional X.509 chain building techniques and path validation, including certificate validity and revocation status checking. The Client SHOULD submit a complete certificate chain in its request. The Authorization Server MAY use additional certificates not included by the Client to construct a chain (e.g. from its own certificate cache or discovered via the X.509 AIA mechanism). If a trusted chain cannot be built and validated by the Authorization Server, the request is denied.

4.3 The Authorization Server validates the aud, exp, iat, and jti values. The aud value MUST contain the Authorization Servers base URL, and the software statement MUST be unexpired. A maximum software statement lifetime of 5 minutes is RECOMMENDED. The Authorization Server MAY deny a request if the same software statement (as determined by the jti value) has been used in a previous registration request.

4.4 The Authorization Server validates the registration parameters in the software statement. If a parameter is invalid or a required parameter is missing, the request is denied.

4.5 If there has been a previous registration granted by the Authorization Server linked to the public key submitted by the Client for the requested grant type, the Authorization Server MAY cancel the previous registration.

5. Authorization responds to request

5.1 If the request is granted, the Authorization Server returns a registration response as per Section 3.2.1 of RFC 7591. The top-level elements of the response SHALL include the client_id issued by the Authorization Server for use by the Client App, the software statement as submitted by the Client App, and all of the registration related parameters that were included in the software statement:

<pre>
HTTP/1.1 201 Created
Content-Type: application/json

{
   "client_id": "example_client_id_issued_by_AS",
   "software_statement": "{the software statement as submitted by the client}", 
   "client_name": string,
   "redirect_uris": [array of URIs],
   "grant_types": "authorization_code",
   "response_types": "code",
   "token_endpoint_auth_method": "private_key_jwt"
}
</pre>

In addition, the Authorization Server MUST store the certificate provided by the Client for use to validate subsequent client authentication attempts.

5.2 If the request is denied, the Authorization Server returns an error as per Section 3.2.2 of RFC 7591. Denials related to trust validation SHOULD use the unapproved_software_statement code. Denials related to invalid signatures should use the invalid_software_statement code. The Authorization Server MAY include an error_description parameter. For example:

<pre>
HTTP/1.1 400 Bad Request
Content-Type: application/json

{
   "error": "unapproved_software_statement"
}
</pre>

Note: if the Client App receives an error code from the Authorization Server, then the Client App MAY attempt registration again by generating a new software statement specifying a different client certificate. For example, if the Client App has been issued two certificates corresponding to two trust communities, it MAY attempt registration using the second certificate if the registration using the first certificate is denied. The Client App SHOULD NOT attempt registration again with the same certificate if an unapproved_software_statement error is returned.




[Next Page](Security_and_Privacy.html)